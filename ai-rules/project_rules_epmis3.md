# EPMIS3 项目规则

## 技术栈要求
- **JDK 版本要求**：本项目后端代码必须兼容 JDK 1.7，禁止使用 JDK 1.8 及以上新特性。
- **浏览器兼容性**：前端需兼容 IE（Internet Explorer）浏览器。
- **IE JSON 兼容性**：如页面中需使用 `JSON.stringify` 或 `JSON.parse` 等 `JSON` 对象相关方法，为兼容 IE 浏览器，请务必引入 json2.js。
- **参数传递方式**：仅支持 form 表单形式的参数传递。
- **日志规范**：项目不使用日志框架。