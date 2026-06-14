<style>
/* ===== 飞迭 PHIDIE 登录页 ===== */
* { box-sizing: border-box; margin: 0; padding: 0; }

body, html { height: 100%; }

body.login-page {
    font-family: -apple-system, BlinkMacSystemFont, 'PingFang SC', 'Microsoft YaHei', 'Segoe UI', sans-serif;
    background: #f0f4f8;
}

/* 覆盖 EspoCRM 默认容器 */
body.login-page .container.content { padding: 0; margin: 0; max-width: 100%; width: 100%; }
body.login-page .container-centering { display: flex; min-height: 100vh; }

/* ===== 左侧品牌面板 ===== */
.phidie-brand-panel {
    flex: 0 0 58%;
    background: linear-gradient(145deg, #0a1628 0%, #0d2144 35%, #1a3a6c 70%, #1565c0 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    padding: 60px;
}

/* 装饰圆圈 */
.phidie-brand-panel::before {
    content: '';
    position: absolute;
    width: 700px; height: 700px;
    border-radius: 50%;
    border: 1px solid rgba(255,255,255,0.04);
    top: -200px; left: -200px;
}
.phidie-brand-panel::after {
    content: '';
    position: absolute;
    width: 500px; height: 500px;
    border-radius: 50%;
    border: 1px solid rgba(255,255,255,0.04);
    bottom: -150px; right: -100px;
}

/* 光晕效果 */
.brand-glow {
    position: absolute;
    width: 400px; height: 400px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(66,165,245,0.12) 0%, transparent 70%);
    top: 50%; left: 50%;
    transform: translate(-50%, -50%);
    pointer-events: none;
}

.brand-inner {
    position: relative;
    z-index: 2;
    text-align: left;
    max-width: 480px;
    width: 100%;
}

/* Logo 主体 */
.brand-logo-block {
    margin-bottom: 36px;
}
.brand-logo-icon {
    width: 56px; height: 56px;
    background: linear-gradient(135deg, #42a5f5, #1976d2);
    border-radius: 14px;
    display: flex; align-items: center; justify-content: center;
    margin-bottom: 20px;
    box-shadow: 0 8px 32px rgba(66,165,245,0.35);
}
.brand-logo-icon svg { width: 32px; height: 32px; fill: white; }

.brand-name-zh {
    font-size: 52px;
    font-weight: 800;
    color: #ffffff;
    letter-spacing: 6px;
    line-height: 1;
    display: block;
}
.brand-name-en {
    font-size: 18px;
    font-weight: 300;
    color: rgba(255,255,255,0.5);
    letter-spacing: 10px;
    margin-top: 8px;
    display: block;
}

/* 分割线 */
.brand-divider {
    width: 48px; height: 3px;
    background: linear-gradient(90deg, #42a5f5, transparent);
    border-radius: 2px;
    margin: 28px 0;
}

/* 标语 */
.brand-tagline {
    font-size: 15px;
    color: rgba(255,255,255,0.65);
    letter-spacing: 3px;
    margin-bottom: 48px;
    font-weight: 300;
}

/* 功能亮点 */
.brand-features { list-style: none; }
.brand-features li {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 12px 0;
    color: rgba(255,255,255,0.75);
    font-size: 14px;
    border-bottom: 1px solid rgba(255,255,255,0.06);
}
.brand-features li:last-child { border-bottom: none; }
.feature-dot {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: #42a5f5;
    flex-shrink: 0;
    box-shadow: 0 0 8px rgba(66,165,245,0.6);
}

/* 底部版权 */
.brand-copyright {
    position: absolute;
    bottom: 32px; left: 60px;
    font-size: 12px;
    color: rgba(255,255,255,0.25);
    letter-spacing: 1px;
}

/* ===== 右侧登录面板 ===== */
.phidie-login-panel {
    flex: 0 0 42%;
    background: #f8fafc;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 48px 40px;
}

.login-card-wrap {
    width: 100%;
    max-width: 380px;
}

/* 顶部小 Logo */
.login-top-brand {
    text-align: center;
    margin-bottom: 40px;
}
.login-top-brand .mini-logo {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    color: #1565c0;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: 2px;
}
.mini-logo-dot {
    width: 28px; height: 28px;
    background: linear-gradient(135deg, #1976d2, #42a5f5);
    border-radius: 7px;
    display: flex; align-items: center; justify-content: center;
}
.mini-logo-dot svg { width: 16px; height: 16px; fill: white; }

/* 登录标题 */
.login-heading {
    text-align: center;
    margin-bottom: 32px;
}
.login-heading h1 {
    font-size: 26px;
    font-weight: 700;
    color: #0d1b2a;
    margin-bottom: 8px;
    letter-spacing: 1px;
}
.login-heading p {
    font-size: 13px;
    color: #94a3b8;
}

/* 错误提示 */
.phidie-message {
    background: #fef2f2;
    border: 1px solid #fecaca;
    border-left: 3px solid #ef4444;
    color: #b91c1c;
    padding: 12px 16px;
    border-radius: 8px;
    font-size: 13px;
    margin-bottom: 20px;
}

/* 表单 */
.phidie-form-group {
    margin-bottom: 20px;
}
.phidie-form-group label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #374151;
    margin-bottom: 8px;
    letter-spacing: 0.3px;
}
.phidie-form-group .input-wrap {
    position: relative;
}
.phidie-form-group .input-icon {
    position: absolute;
    left: 14px; top: 50%;
    transform: translateY(-50%);
    color: #94a3b8;
    font-size: 15px;
    pointer-events: none;
}
.phidie-form-group input {
    width: 100%;
    padding: 12px 16px 12px 42px;
    background: #ffffff;
    border: 1.5px solid #e2e8f0;
    border-radius: 10px;
    font-size: 14px;
    color: #1e293b;
    outline: none;
    transition: all 0.2s;
    -webkit-appearance: none;
}
.phidie-form-group input:focus {
    border-color: #1976d2;
    box-shadow: 0 0 0 3px rgba(25,118,210,0.1);
}
.phidie-form-group input::placeholder { color: #cbd5e1; }

/* 登录按钮 */
#btn-login {
    width: 100%;
    padding: 14px;
    margin-top: 8px;
    background: linear-gradient(135deg, #1565c0, #1976d2);
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 600;
    letter-spacing: 2px;
    cursor: pointer;
    transition: all 0.25s;
    box-shadow: 0 4px 16px rgba(21,101,192,0.3);
    font-family: inherit;
}
#btn-login:hover {
    background: linear-gradient(135deg, #0d47a1, #1565c0);
    box-shadow: 0 6px 24px rgba(21,101,192,0.45);
    transform: translateY(-1px);
}
#btn-login:active { transform: translateY(0); }

/* 底部提示 */
.login-footer-note {
    text-align: center;
    margin-top: 28px;
    font-size: 12px;
    color: #cbd5e1;
}

/* 响应式 */
@media (max-width: 900px) {
    body.login-page .container-centering { flex-direction: column; }
    .phidie-brand-panel { flex: 0 0 220px; padding: 40px 32px; }
    .brand-name-zh { font-size: 36px; }
    .brand-tagline, .brand-features { display: none; }
    .phidie-login-panel { flex: 1; }
    .brand-copyright { bottom: 16px; left: 32px; }
}
</style>

<!-- 左侧品牌区 -->
<div class="phidie-brand-panel">
    <div class="brand-glow"></div>
    <div class="brand-inner">
        <div class="brand-logo-block">
            <div class="brand-logo-icon">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                </svg>
            </div>
            <span class="brand-name-zh">飞迭</span>
            <span class="brand-name-en">PHIDIE</span>
        </div>
        <div class="brand-divider"></div>
        <p class="brand-tagline">智能客户关系管理平台</p>
        <ul class="brand-features">
            <li><span class="feature-dot"></span>全面的客户全生命周期管理</li>
            <li><span class="feature-dot"></span>销售流程自动化与智能跟进</li>
            <li><span class="feature-dot"></span>数据驱动的业务洞察与决策</li>
            <li><span class="feature-dot"></span>多团队协作，统一客户视图</li>
        </ul>
    </div>
    <span class="brand-copyright">© 2025 飞迭 PHIDIE. All rights reserved.</span>
</div>

<!-- 右侧登录区 -->
<div class="phidie-login-panel">
    <div class="login-card-wrap">

        <div class="login-top-brand">
            <div class="mini-logo">
                <div class="mini-logo-dot">
                    <svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                </div>
                飞迭 CRM
            </div>
        </div>

        <div class="login-heading">
            <h1>欢迎回来</h1>
            <p>请登录您的账户以继续使用</p>
        </div>

        {{#if message}}
        <div class="phidie-message">{{message}}</div>
        {{/if}}

        <form id="login-form" autocomplete="on">
            <div class="phidie-form-group" data-name="username">
                <label for="field-userName">用户名</label>
                <div class="input-wrap">
                    <span class="input-icon">&#9679;</span>
                    <input
                        type="text"
                        name="username"
                        id="field-userName"
                        placeholder="请输入用户名"
                        autocapitalize="off"
                        spellcheck="false"
                        tabindex="1"
                        autocomplete="username"
                        maxlength="255"
                    >
                </div>
            </div>

            <div class="phidie-form-group" data-name="password">
                <label for="field-password">密码</label>
                <div class="input-wrap">
                    <span class="input-icon">&#9632;</span>
                    <input
                        type="password"
                        name="password"
                        id="field-password"
                        placeholder="请输入密码"
                        tabindex="2"
                        autocomplete="current-password"
                        maxlength="255"
                    >
                </div>
            </div>

            <button id="btn-login" type="button" tabindex="3">登 录</button>
        </form>

        <p class="login-footer-note">安全登录 · 数据加密传输</p>
    </div>
</div>
