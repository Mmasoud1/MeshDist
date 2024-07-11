FROM coinstacteam/coinstac-decentralized-test

# Set the working directory
WORKDIR /computation

# Copy the requirements file
COPY requirements.txt /computation

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container
COPY . /computation

# Copy and run the DNS setup script
COPY setup_dns.sh /computation/setup_dns.sh
RUN chmod +x /computation/setup_dns.sh
RUN /computation/setup_dns.sh

# Log network configuration
RUN ip addr show
RUN cat /etc/resolv.conf

# Install additional debugging tools
RUN apt-get update && apt-get install -y curl

# Set the command to run the application
CMD ["python", "./scripts/entry.py"]



