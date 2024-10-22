FROM coinstacteam/coinstac-decentralized-test

# Set the working directory
WORKDIR /computation

# Copy the requirements file
COPY requirements.txt /computation

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container
COPY . /computation

# Install additional debugging tools
RUN apt-get update && apt-get install -y iputils-ping dnsutils curl

# Log network configuration
RUN echo "Logging network configuration..." && \
    ip addr show && \
    cat /etc/resolv.conf

# Set the command to run the application
CMD ["sh", "-c", "echo 'Checking DNS resolution...' && nslookup google.com && echo 'Starting coinstac-simulator...' && coinstac-simulator"]

