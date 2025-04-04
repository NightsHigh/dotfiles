import shutil
from pathlib import Path


class SymlinkManager:
    def __init__(self, file_locations):
        """Initialize with a dictionary of home -> link locations."""
        self.file_locations = self._get_file_locations(file_locations)

        if not self.file_locations:
            raise ValueError(
                "Error: No files to process. The file_locations dictionary is empty."
            )

    def setup_symlinks(self):
        """Public method: Removes existing symlinks/files and creates new ones."""
        self._remove_existing()
        self._create_symlinks()

    def _remove_existing(self):
        """Private method: Remove any existing symlink, file, or directory at the link location."""
        for _, link_loc in self.file_locations.items():
            self._remove_path(link_loc)

    def _create_symlinks(self):
        """Private method: Create symlinks after cleanup."""
        for home_loc, link_loc in self.file_locations.items():
            home_loc_path = Path(home_loc).resolve()
            link_loc_path = Path(link_loc).resolve()

            if home_loc_path != link_loc_path:
                link_loc_path.parent.mkdir(
                    parents=True, exist_ok=True
                )  # Ensure parent directory exists

                print(f"Creating symlink: {link_loc_path} -> {home_loc_path}")
                link_loc_path.symlink_to(home_loc_path)
            else:
                print(f"Error: Cannot create a symlink to itself: {link_loc_path}")

    def _get_file_locations(self, src_folder: Path, use_home: bool = True):
        """Recursively find all files inside src_folder and return a dictionary."""
        home_dir = Path.home()

        file_map = {
            p: (
                (home_dir / p.relative_to(src_folder))
                if use_home
                else p.relative_to(src_folder)
            )
            for p in src_folder.rglob("*")
            if p.is_file() or p.is_dir()
        }

        if not file_map:
            raise ValueError(
                f"Error: The source folder '{src_folder}' contains no files."
            )

        return file_map

    def _remove_path(self, path):
        """Universal function to remove files, symlinks, and directories."""
        path = Path(path)

        if not path.exists() and not path.is_symlink():
            print(f"No file, symlink, or directory to remove at: {path}")
            return

        try:
            if path.is_symlink() or path.is_file():
                path.unlink()
                print(f"Removed file or symlink: {path}")

            else:  # It's a directory
                shutil.rmtree(path)
                print(f"Removed directory: {path}")

        except Exception as e:
            print(f"Error removing {path}: {e}")
