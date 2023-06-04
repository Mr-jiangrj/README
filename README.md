|      | 镜像列表                                                 | 版本   | 所属项目                                                     |
| ---- | :------------------------------------------------------- | ------ | ------------------------------------------------------------ |
| 1    | registry.cn-hangzhou.aliyuncs.com/jiangrj/ai             | latest | [https://github.com/Mr-jiangrj/AI](https://github.com/Mr-jiangrj/AI) |
| 2    | registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-web         | latest | [https://github.com/Mr-jiangrj/AI-Web](https://github.com/Mr-jiangrj/AI-Web) |
| 3    | registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-azure-proxy | latest | [https://github.com/Mr-jiangrj/AI-Azure-Proxy](https://github.com/Mr-jiangrj/AI-Azure-Proxy) |
| 4    | registry.cn-hangzhou.aliyuncs.com/jiangrj/unmapi         | latest | [https://github.com/Mr-jiangrj/UNMServerApi](https://github.com/Mr-jiangrj/UNMServerApi) |
| 5    | registry.cn-hangzhou.aliyuncs.com/jiangrj/musicapi       | latest | [https://github.com/Mr-jiangrj/NeteaseCloudMusicApi](https://github.com/Mr-jiangrj/NeteaseCloudMusicApi) |
| 6    | registry.cn-hangzhou.aliyuncs.com/jiangrj/siteproxy      | latest | [https://github.com/Mr-jiangrj/SiteProxy](https://github.com/Mr-jiangrj/SiteProxy) |
| 7    | registry.cn-hangzhou.aliyuncs.com/jiangrj/home           | latest | [https://github.com/Mr-jiangrj/home-page](https://github.com/Mr-jiangrj/home-page) |
| 8    | registry.cn-hangzhou.aliyuncs.com/jiangrj/music          | latest | [https://github.com/Mr-jiangrj/SPlayer](https://github.com/Mr-jiangrj/SPlayer) |


# :bookmark_tabs: Web OpenAI for 微软Azure

###### :page_with_curl: docker-compose.yml 创建新的网络

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
      CODE: ["code1","code2","code3"]
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
###### :page_with_curl: docker-compose.yml 连接到现有网络
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
      CODE: ["code1","code2","code3"]
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
> 
> CODE: 可选，设置访问密码

![](https://ghproxy.com/https://github.com/Mr-jiangrj/README/blob/main/Snipaste_2023-06-03_20-16-06.png)
![](https://ghproxy.com/https://github.com/Mr-jiangrj/README/blob/main/Snipaste_2023-06-03_20-16-25.png)

# :bookmark_tabs: OpenAI for Wechat/WxWork/公众号

```shell
docker run -dit --name <name> \
    --hostname <hostname> \
    --restart always \
    --network <Network-Name> \
    -v <path>:/app \
    -p <host-port>:<container-port> \
    registry.cn-hangzhou.aliyuncs.com/jiangrj/ai
```
> 全局配置文件：/app/config.json（配置参考：[https://github.com/Mr-jiangrj/AI](https://github.com/Mr-jiangrj/AI)）
> 
> 插件管理密码配置：/app/config-plugins-godcmd.json（参考：[config-plugins-godcmd.json](https://github.com/Mr-jiangrj/README/blob/main/config-plugins-godcmd.json)）
> 
> 工作目录：/opt/AI
> 
> 插件目录：/opt/AI/plugins
> 
> 支持 OpenAI、Azure OpenAI

###### :page_with_curl: config.json 配置示例

- [x] 个人微信号：[config-wx.json](https://github.com/Mr-jiangrj/README/blob/main/config-wx.json)
- [x] 微信公众号：[config-mpwx.json](https://github.com/Mr-jiangrj/README/blob/main/config-mpwx.json)
- [x] 企业微信应用：[config-wxcomapp.json](https://github.com/Mr-jiangrj/README/blob/main/config-wxcomapp.json)

###### :page_with_curl: config.json 配置示例
