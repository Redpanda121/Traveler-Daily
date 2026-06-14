# 旅者手札

这是一个用 Hugo 搭建的个人博客。

## 日常使用

1. 双击 `new-post.bat` 新建文章。
2. 编辑 `content/posts` 中新建的 Markdown 文件。
3. 双击 `start-blog.bat` 在本机预览。
4. 双击 `save-git.bat` 保存并上传文章。

连接 GitHub Pages 后，每次上传都会自动更新公开网站。

## 第一次发布

1. 在 GitHub 创建一个空的公开仓库，不要勾选自动添加 README。
2. 双击 `connect-github.bat`，粘贴仓库的 HTTPS 地址。
3. 打开仓库的 `Settings` > `Pages`。
4. 将 `Source` 选择为 `GitHub Actions`。
5. 打开 `Actions` > `Publish blog`，点击 `Run workflow`。
6. 等待绿色完成标志，然后在 `Settings` > `Pages` 查看网址。

以后只需运行 `save-git.bat`。
