import globals as g
import tools.file_manager as fm
import tools.package_installer as pi

## pi.install_packages("/home/eske/dotfiles/setup/python_version/packages/basic_tools.txt")

test_conf = fm.SymlinkManager(g.DOTFILES_PATH_CONFIG_TEST)
test_conf.setup_symlinks()
