FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update
RUN apt-get -y install expect bash python3 cmake g++
# RUN apt-get install --no-cache bash curl git python3
# RUN apt-get install --no-cache musl-dev libc-dev
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# ENV NVM_DIR "$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh)"
# RUN nvm use 20
# RUN npm install -g yarn@1.22.21
RUN npm uninstall -g yarn
RUN corepack enable
RUN yarn set version 4.4.1

COPY ./init.exp /init.exp
RUN chmod +x /init.exp

ENTRYPOINT [ "/init.exp" ]
