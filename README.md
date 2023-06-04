# Web OpenAI for 微软Azure

###### docker-compose.yml 创建新的网络

```yaml
version: '3'

services:
  ai-web:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-web
    ports:
      - 3000:3000
    environment:
      OPENAI_API_KEY: "Azure OpenAI API Key"
      BASE_URL: "http://ai-azure-proxy:8080"
    depends_on:
      - ai-azure-proxy
    links:
      - ai-azure-proxy
    networks:
      - ChatGPT

  ai-azure-proxy:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-azure-proxy
    ports:
      - 8080:8080
    environment:
      AZURE_OPENAI_ENDPOINT: "Azure OpenAI API 接口"
      AZURE_OPENAI_MODEL_MAPPER: "gpt-3.5-turbo=gpt-35-turbo"
      AZURE_OPENAI_API_VER: "2023-03-15-preview"
    networks:
      - ChatGPT

networks:
  ChatGPT:
    driver: bridge
```
> AZURE_OPENAI_MODEL_MAPPER 填写格式：<AI模型>=<部署名称>
###### docker-compose.yml 连接到现有网络
```yaml
version: '3'

services:
  ai-web:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-web
    ports:
      - 3000:3000
    environment:
      OPENAI_API_KEY: "Azure OpenAI API Key"
      BASE_URL: "http://ai-azure-proxy:8080"
    depends_on:
      - ai-azure-proxy
    links:
      - ai-azure-proxy
    networks:
      - ChatGPT

  ai-azure-proxy:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-azure-proxy
    ports:
      - 8080:8080
    environment:
      AZURE_OPENAI_ENDPOINT: "Azure OpenAI API 接口"
      AZURE_OPENAI_MODEL_MAPPER: "gpt-3.5-turbo=gpt-35-turbo"
      AZURE_OPENAI_API_VER: "2023-03-15-preview"
    networks:
      - ChatGPT

networks:
  ChatGPT:
    external: true
    name: <NetworkName>
```
> AZURE_OPENAI_MODEL_MAPPER 填写格式：<AI模型>=<部署名称>


![](https://github.com/Mr-jiangrj/auth/blob/main/Snipaste_2023-06-03_20-16-06.png)
![](https://github.com/Mr-jiangrj/auth/blob/main/Snipaste_2023-06-03_20-16-25.png)

# OpenAI for Wechat/WxWork/公众号

> 支持 OpenAI、Azure OpenAI

```shell
docker run -dit --name <name> \
    --hostname <hostname> \
    --restart always \
    --network <Network-Name> \
    -v <path>:/app \
    -p <host-port>:<container-port> \
    registry.cn-hangzhou.aliyuncs.com/jiangrj/ai
```
> 配置文件：/app/config.json（配置参考：[https://github.com/Mr-jiangrj/AI](https://github.com/Mr-jiangrj/AI)）
> 
> 应用目录：/opt/AI
> 
> 插件目录：/opt/AI/plugins
