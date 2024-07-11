import logging
import socket
import coinstac
import local as local
import remote as remote

logging.basicConfig(level=logging.DEBUG)

try:
    # Example network operation
    logging.info("Starting network operation")
    addr_info = socket.getaddrinfo("google.com", None)
    logging.info(f"Address info: {addr_info}")

    # Start coinstac
    logging.info("Starting coinstac")
    coinstac.start(local.start, remote.start)

except Exception as e:
    logging.error(f"An error occurred: {e}")
