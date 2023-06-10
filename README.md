| 镜像列表                                                 | 所属项目                                                     |
| :------------------------------------------------------- | ------------------------------------------------------------ |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/ai             | [https://github.com/Mr-jiangrj/AI](https://github.com/Mr-jiangrj/AI/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-web         | [https://github.com/Mr-jiangrj/AI-Web](https://github.com/Mr-jiangrj/AI-Web/blob/main/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/ai-azure-proxy | [https://github.com/Mr-jiangrj/AI-Azure-Proxy](https://github.com/Mr-jiangrj/AI-Azure-Proxy/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/unmapi         | [https://github.com/Mr-jiangrj/UNMServerApi](https://github.com/Mr-jiangrj/UNMServerApi/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/musicapi       | [https://github.com/Mr-jiangrj/NeteaseCloudMusicApi](https://github.com/Mr-jiangrj/NeteaseCloudMusicApi/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/siteproxy      | [https://github.com/Mr-jiangrj/SiteProxy](https://github.com/Mr-jiangrj/SiteProxy/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/home           | [https://github.com/Mr-jiangrj/home-page](https://github.com/Mr-jiangrj/home-page/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/music          | [https://github.com/Mr-jiangrj/SPlayer](https://github.com/Mr-jiangrj/SPlayer/blob/master/Dockerfile) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data        | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu    | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-comfy-cpu   | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto        | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-comfy       | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |
| registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-invoke      | [https://github.com/Mr-jiangrj/Stable-Diffusion](https://github.com/Mr-jiangrj/Stable-Diffusion/tree/master/.github/workflows) |


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
> Stable Diffusion插件配置：/app/config-plugins-sdwebui.json（示例文件：/opt/AI/plugins/sdwebui/config.json.template）
> 
> 工作目录：/opt/AI（请不要映射此目录，否则会导致项目丢失）
>
> 插件目录：/opt/AI/plugins（请不要映射此目录，否则会导致插件丢失）
>
> 支持 OpenAI、Azure OpenAI

###### :page_with_curl: config.json 配置示例

- [x] 个人微信号：[config-wx.json](https://github.com/Mr-jiangrj/README/blob/main/config-wx.json)
- [x] 微信公众号：[config-mpwx.json](https://github.com/Mr-jiangrj/README/blob/main/config-mpwx.json)
- [x] 企业微信应用：[config-wxcomapp.json](https://github.com/Mr-jiangrj/README/blob/main/config-wxcomapp.json)

###### :page_with_curl: config-plugins-godcmd.json 配置示例

```shell
{
  "password": "password",
  "admin_users": []
}
```

# :bookmark_tabs: Stable Diffusion 环境部署

###### docker-compose.yml

```yaml
version: "3"

services:

  sd-data:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data
    container_name: sd-data
    volumes:
      - /opt/sd:/data
    networks:
      - SD-NET

  sdwebui:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu
    container_name: sdwebui
    ports:
      - 80:7860
    stop_signal: SIGINT
    environment:
      - "CLI_ARGS=--use-cpu=all --no-half --allow-code --enable-insecure-extension-access --share --api"
      # - "CLI_ARGS=--no-half --precision full --allow-code --enable-insecure-extension-access --api"
    networks:
      - SD-NET
    volumes:
      - /opt/sd/data:/data
      - /opt/sd/output:/output

networks:
  SD-NET:
    driver: bridge

```

###### Docker 手动部署

```shell
# 安装 Docker-CE
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# 拉取 Stable-Diffusion 镜像
docker pull registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data
docker pull registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu

# 创建 Stable-Diffusion 数据
docker run -it --rm -v /opt/sd:/data registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data

# 创建 Stable-Diffusion WebUI
docker run -dit --name sdwebui --hostname sdwebui --restart always \
    -p 80:7860 --stop_signal=SIGINT -v /opt/sd/data:/data -v /opt/sd/output:/output \
    -e "CLI_ARGS=--use-cpu=all --no-half --allow-code --enable-insecure-extension-access --share --api" \
    registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu

```

###### 更多模型

| 序号 | 写实风格                                                     |
| :--: | ------------------------------------------------------------ |
|  1   | [Stable Diffusion：https://huggingface.co/stabilityai/stable-diffusion-2-1](https://huggingface.co/stabilityai/stable-diffusion-2-1) |
|  2   | [Chilloutmix：https://civitai.com/models/6424/chilloutmix](https://civitai.com/models/6424/chilloutmix) |
|  3   | [Deliberate：https://civitai.com/models/4823/deliberate](https://civitai.com/models/4823/deliberate) |

| 序号 | 动漫风格                                                     |
| :--: | ------------------------------------------------------------ |
|  1   | [Anything：https://huggingface.co/andite/anything-v4.0](https://huggingface.co/andite/anything-v4.0) |
|  2   | [Waifu Diffusion：https://huggingface.co/hakurei/waifu-diffusion-v1-4](https://huggingface.co/hakurei/waifu-diffusion-v1-4) |
|  3   | [Hentai Diffusion：https://github.com/Delcos/Hentai-Diffusion](https://github.com/Delcos/Hentai-Diffusion) |
|  4   | [DreamShaper：https://civitai.com/models/4384/dreamshaper](https://civitai.com/models/4384/dreamshaper) |
|  5   | [OrangeMix3：https://huggingface.co/WarriorMama777/OrangeMixs](https://huggingface.co/WarriorMama777/OrangeMixs) |

> 模型路径：/data/StableDiffusion（更多路径可进入容器检查：ls -l /stable-diffusion-webui/）

###### 其它模型参考
[细数【SD-WEBUI】的模型：谁是最适合的模型从哪里找到它们](http://wed.xjx100.cn/news/148980.html?action=onClick)
