FROM fedora:35

LABEL maintainer="Sean Nelson <hyperkineticnerd@gmail.com>"
LABEL build_date="2023-02-21"

WORKDIR /github/workspace

RUN dnf install -y docker \
                   gcc \
                   git-core \
                   python3-devel \
                   python3-libselinux \
                   python3-jmespath \
                   python3-pip \
                   rsync ; \
    dnf clean all

ADD requirements.txt /requirements.txt
RUN python3 -m pip install -r /requirements.txt && \
    python3 -m pip cache purge

ADD cmd.sh /cmd.sh
CMD sh /cmd.sh
