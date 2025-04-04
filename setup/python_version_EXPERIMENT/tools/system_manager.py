import urllib.request

import NetworkManager

import command_runner as cr
import logger


class SystemHelper:
    def __init__(self, log_name, logger: logger.Logger):
        self.log_name = log_name
        self.logger = logger
        pass

    def check_connectivity(self):
        urls_to_check = [
            "https://www.google.com",
            "https://www.cloudflare.com",
            "https://github.com",
            "https://www.duckduckgo.com",
        ]

        for url in urls_to_check:
            try:
                # Try to open a connection to the URL
                urllib.request.urlopen(url, timeout=5)
                return True  # If any of the URLs succeed, return True
            except urllib.request.HTTPError:
                continue  # If it fails, try the next URL

        return False  # If none of the URLs succeeded, return False

    def check_service_status(self, service_name):
        result = cr.run(
            ["systemctl", "is-active", "--quiet", service_name],
            self.log_name,
            self.logger,
        )
        if result is None:
            return False  # If the result is None, the command failed
        elif result.returncode == 0:
            return True
        else:
            return False


logger = logger.Logger("~/dotfiles/logs/")
sh = SystemHelper("sys.log", logger)
