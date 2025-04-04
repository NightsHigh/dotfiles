import subprocess

import logger


def run(command, log_name, logger: logger.Logger):
    try:
        result = subprocess.run(
            command,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        return result
    except Exception as e:
        logger.log(log_name, f"Failed executing: {' '.join(command)}", str(e))
        print(f"Error executing {command[0]}: {str(e)}")
        return None
