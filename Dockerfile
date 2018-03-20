FROM debian:stretch
ENV DISPLAY=:0

# install asterisk as IPBX server, gtkterm for the router and chromium for configurate  the phone
RUN useradd -m cacao \
    && apt-get update && apt-get install -y asterisk-prompt-fr-armelle \
                                                             gtkterm \
                                                             chromium

# empty the current contents of the 3 asterisk configuration files
RUN echo > /etc/asterisk/sip.conf \
    && echo > /etc/asterisk/extensions.conf \
    && echo > /etc/asterisk/voicemail.conf

COPY sipconf /etc/asterisk/sip.conf
COPY extensions /etc/asterisk/extensions.conf
COPY voicemail /etc/asterisk/voicemail.conf

ENTRYPOINT 'gtkterm'
