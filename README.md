Slider 社交应用 2025.12 – 2026.01
核心开发 技术栈：Flutter + Provider + Dio + Sqflite + Spring Boot
• 项目描述：开发轻量级社交应用客户端，涵盖信息流浏览、内容发布、用户主页等功能，完成端到端
数据交互闭环。
• 网络层封装：基于 Dio 二次封装统一网络模块，覆盖 GET/POST/PUT/DELETE 方法；通过 Interceptor
实现 Token 自动注入及全局异常处理。
• 状态管理架构：采用 Provider + ChangeNotifier 模式，通过 Consumer 订阅数据变化；引入事件总线解
耦模块，实现业务逻辑与 UI 组件分离，提升可维护性。
• 启动优化：利用 Sqflite 实现本地缓存策略，通过“启动页缓存 + 预加载”机制，有效减少冷启动白屏
时间。
• 渲染性能调优： – 使用 ListView.builder 按需构建列表项，对稳定组件使用 const 修饰并固定高度，避免不必要
的 Rebuild。 – 实测信息流滚动稳定保持 60fps (高刷设备 120fps)。
– 解决嵌套滚动冲突：通过 ConstrainedBox 和 Align 联动限制高度，完美实现竖向列表中嵌入横
向滑动列表。
