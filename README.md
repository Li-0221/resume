# 李立简历

- [网页简历](https://resume.inwe-ai.com/)
- [技术文档](https://li-0221.github.io/doc/)
- [v10 PDF](李立-简历-v10.pdf) / [DOCX](李立-简历-v10.docx)

## 更新网页

`index.html` 是独立静态页面，`deploy.sh` 仅将它和当前 PDF 上传到服务器。运行脚本前需要可用的 `server-134` SSH 别名，以及 `rsync` 和 `rg`：

```bash
bash deploy.sh
```

服务器首次配置所用的 Nginx 站点文件位于 `nginx/`。更新简历内容不需要重新上传 Nginx 配置。

生成下一版 Markdown、DOCX 和 PDF 后，先询问是否同步网页；确认后再更新 `index.html`、`deploy.sh` 中的 PDF 文件名和 `.gitignore` 的公开文件白名单，并检查网页及下载链接。Markdown 原件末尾含不用于投递的备注，仅保留在本地；`历史版本/`、`参考资料/`、`面试素材/` 和本地 `AGENTS.md` 也不属于公开仓库。
