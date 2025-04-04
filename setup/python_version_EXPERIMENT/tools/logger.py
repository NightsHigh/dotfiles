import os


class Logger:
    def __init__(self, log_directory):
        """Initialize the Logger object with a directory to store log files."""
        self.log_directory = os.path.expanduser(log_directory)
        # Ensure the log directory exists
        os.makedirs(self.log_directory, exist_ok=True)

    def log(self, log_name, error_headline, error_message):
        """Log the error message into the specified log file."""
        log_file = os.path.join(self.log_directory, log_name)

        # Open the log file in append mode
        with open(log_file, "a") as f:
            # Check if the log file is empty, and if so, write a header
            if os.stat(log_file).st_size == 0:
                f.write(f"Log started for {log_name}\n{'='*40}\n\n")
            # Write the log content
            f.write(f"{'='*40}\n")
            f.write(f"{error_headline}\n")
            f.write(f"{error_message}\n")
            f.write(f"{'='*40}\n\n")
