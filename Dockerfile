FROM coinstacteam/coinstac-decentralized-test

# Set the working directory
WORKDIR /computation

# Copy the requirements file
COPY requirements.txt /computation

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container
COPY . /computation

# Add DNS settings to the container
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Verify network connectivity
RUN apt-get update && apt-get install -y iputils-ping dnsutils
RUN ping -c 4 google.com
RUN nslookup google.com

# Set the command to run the application
CMD ["python", "./scripts/entry.py"]


