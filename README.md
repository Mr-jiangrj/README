# Azure OpenAI for Web 部署

###### docker-compose.yml

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
      - chatgpt

  ai-azure-proxy:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-azure-proxy
    ports:
      - 8080:8080
    environment:
      AZURE_OPENAI_ENDPOINT: "Azure OpenAI API 接口"
      AZURE_OPENAI_MODEL_MAPPER: "gpt-3.5-turbo=gpt-35-turbo"
      AZURE_OPENAI_API_VER: "2023-03-15-preview"
    networks:
      - chatgpt

networks:
  chatgpt:
    driver: bridge
```
"gpt-3.5-turbo=gpt-35-turbo" 格式：模型名称=部署名称
