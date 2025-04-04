import os
import sys

import command_runner as cr
import logger


class PackageManager:
    def __init__(self, log_name, logger: logger.Logger):
        self.log_name = log_name
        self.logger = logger

    def install_packages(self, package_file):
        cr.run(["sudo", "pacman", "-Syy"], self.log_name, self.logger)
        packages = self._extract_packages_from_file(package_file)
        for package in packages:
            self._install_package(package)

    def _verify_package(self, package):
        """Check if the package is already installed."""
        check_installed = cr.run(["pacman", "-Q", package], self.log_name, self.logger)
        if check_installed is None:
            return False  # Return False if the command failed (None means failure)
        return check_installed.returncode == 0

    def _extract_packages_from_file(self, file_path):
        """Extract package names from a file."""
        with open(file_path, "r") as file:
            return [line.strip() for line in file if line.strip()]

    def _install_package(self, package):
        """Install a package if it's not already installed."""
        sys.stdout.write(f"Installing {package} ... ")
        sys.stdout.flush()

        result = cr.run(
            ["yay", "-S", "--noconfirm", package], self.log_name, self.logger
        )
        if result is None or not self._verify_package(package):
            sys.stdout.write(f"\r\033[31mError installing {package}\033[0m\n")
            if result:
                self.logger.log(
                    self.log_name,
                    f"yay -S --noconfirm {package}",
                    result.stderr + result.stdout,
                )
        else:
            sys.stdout.write(f"\r\033[32mSuccessfully installed {package}\033[0m\n")


log = logger.Logger("~/dotfiles/logs/")
pm = PackageManager("Install.log", log)
package_file = os.path.expanduser(
    "~/dotfiles/setup/python_version/packages/basic_tools.txt"
)
pm.install_packages(package_file)
