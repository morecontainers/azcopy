FROM    alpine:latest
ADD     https://aka.ms/downloadazcopy-v10-linux /downloadazcopy-v10-linux
RUN     tar -xvz --strip-components=1 -f downloadazcopy-v10-linux
RUN     chmod +x /azcopy

FROM    ubuntu:22.04
COPY    --from=0 /azcopy /NOTICE.txt /
ENTRYPOINT ["/azcopy"]
