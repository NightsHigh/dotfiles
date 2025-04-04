import os
from pathlib import Path

# ------------------------------------------
# Paths
# ------------------------------------------

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
DIR_LOGS = os.path.expanduser("~/dotfiles/logs/")
DIR_TEMP = os.path.join(PROJECT_ROOT, "temp")


# ------------------------------------------
# Log names
# ------------------------------------------

LOG_NAME_INSTALL = "Install.log"
LOG_NAME_SYS = "Sys.log"
LOG_NAME_HYPR = "Hypr.log"

# ------------------------------------------
# System Paths
# ------------------------------------------

SYS_PATH_SDDM_THEMES = "/usr/share/sddm/themes/"
SYS_ETC_PATH = "/etc/"
SYS_HOME = Path.home()

# ------------------------------------------
# Dotfiles Paths
# ------------------------------------------
DOTFILES_PATH = SYS_HOME / "dotfiles"
DOTFILES_PATH_CONFIG = DOTFILES_PATH / "links"
DOTFILES_PATH_INITIAL_CONFIG = DOTFILES_PATH / "setup" / "initial_config"
DOTFILES_PATH_CONFIG_TEST = DOTFILES_PATH / "setup" / "test"  # For debugging
DOTFILES_PATH_CONFIG_TEST2 = DOTFILES_PATH / "setup" / "tools"  # For debugging
