FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Download and install the latest version of Julia
RUN curl -sSL "https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.0-linux-x86_64.tar.gz" -o julia.tar.gz && \
    tar -xzf julia.tar.gz && \
    rm julia.tar.gz && \
    mv julia-* /opt/julia && \
    ln -s /opt/julia/bin/julia /usr/local/bin/julia

# Set the default Julia version
ENV JULIA_PATH /opt/julia
ENV PATH $JULIA_PATH/bin:$PATH

# Move into the main folder
WORKDIR /root/JuliaServer.jl

# Copy the Julia files to the container
COPY . .

# Run Julia
CMD ["julia"]