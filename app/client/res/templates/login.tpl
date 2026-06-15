<style>
* {
    box-sizing: border-box;
}

html,
body {
    min-height: 100%;
}

body.login-page {
    margin: 0;
    overflow: hidden;
    background: #eef2f6;
    color: #101828;
    font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Microsoft YaHei", "Segoe UI", sans-serif;
}

body.login-page .container.content {
    display: grid;
    grid-template-columns: minmax(0, 58fr) minmax(320px, 42fr);
    width: 100%;
    max-width: none;
    margin: 0;
    padding: 0;
    height: 100vh;
}

body.login-page .container-centering {
    display: grid;
    grid-template-columns: minmax(0, 58fr) minmax(320px, 42fr);
    height: 100vh;
    min-height: 100vh;
    margin: 0 !important;
    padding: 0 !important;
    align-items: stretch !important;
}

.brand-panel {
    position: relative;
    display: flex;
    align-items: center;
    overflow: hidden;
    padding: 64px;
    background:
        linear-gradient(135deg, rgba(10, 27, 47, 0.96), rgba(15, 78, 91, 0.92)),
        #0b1f34;
}

.brand-panel::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(rgba(255, 255, 255, 0.055) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.055) 1px, transparent 1px);
    background-size: 44px 44px;
    opacity: 0.8;
}

.brand-panel::after {
    content: "";
    position: absolute;
    right: -160px;
    bottom: -180px;
    width: 520px;
    height: 520px;
    border-radius: 50%;
    border: 1px solid rgba(255, 255, 255, 0.12);
    background: radial-gradient(circle, rgba(77, 199, 185, 0.2), transparent 62%);
}

.brand-content {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 620px;
}

.brand-logo {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 72px;
    color: #fff;
    font-size: 18px;
    font-weight: 720;
}

.brand-logo-mark {
    display: grid;
    width: 42px;
    height: 42px;
    place-items: center;
    border-radius: 12px;
    background: #fff;
    color: #0f5f6d;
    font-size: 18px;
    font-weight: 800;
}

.brand-kicker {
    margin-bottom: 16px;
    color: #8fe4d8;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.18em;
}

.brand-title {
    max-width: 580px;
    margin: 0;
    color: #fff;
    font-size: 42px;
    font-weight: 760;
    line-height: 1.18;
}

.brand-summary {
    max-width: 560px;
    margin: 22px 0 42px;
    color: rgba(255, 255, 255, 0.72);
    font-size: 15px;
    line-height: 1.85;
}

.capability-list {
    display: grid;
    gap: 12px;
    max-width: 520px;
}

.capability-item {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 14px 16px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.075);
    color: rgba(255, 255, 255, 0.8);
    font-size: 13px;
    line-height: 1.6;
}

.capability-dot {
    flex: 0 0 auto;
    width: 8px;
    height: 8px;
    margin-top: 6px;
    border-radius: 50%;
    background: #8fe4d8;
    box-shadow: 0 0 0 4px rgba(143, 228, 216, 0.12);
}

.login-panel {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 56px 48px;
    background: #fbfcfe;
    min-width: 0;
}

.login-card {
    width: 100%;
    max-width: 380px;
}

.login-header {
    margin-bottom: 32px;
}

.login-label {
    margin-bottom: 12px;
    color: #0f5f6d;
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 0.16em;
}

.login-header h1 {
    margin: 0 0 10px;
    color: #101828;
    font-size: 28px;
    font-weight: 760;
}

.login-header p {
    margin: 0;
    color: #667085;
    font-size: 14px;
    line-height: 1.7;
}

.phidie-message {
    margin-bottom: 18px;
    padding: 12px 14px;
    border: 1px solid #fecaca;
    border-left: 3px solid #ef4444;
    border-radius: 8px;
    background: #fff1f2;
    color: #991b1b;
    font-size: 13px;
}

.phidie-form-group {
    margin-bottom: 18px;
}

.phidie-form-group label {
    display: block;
    margin-bottom: 8px;
    color: #344054;
    font-size: 13px;
    font-weight: 650;
}

.phidie-form-group input {
    width: 100%;
    height: 46px;
    padding: 0 14px;
    border: 1px solid #d0d5dd;
    border-radius: 8px;
    outline: none;
    background: #fff;
    color: #101828;
    font-size: 14px;
    transition: border-color 0.18s, box-shadow 0.18s;
}

.phidie-form-group input::placeholder {
    color: #98a2b3;
}

.phidie-form-group input:focus {
    border-color: #0f8a7d;
    box-shadow: 0 0 0 3px rgba(15, 138, 125, 0.14);
}

#btn-login {
    width: 100%;
    height: 48px;
    margin-top: 8px;
    border: none;
    border-radius: 8px;
    background: #0f5f6d;
    color: #fff;
    cursor: pointer;
    font-family: inherit;
    font-size: 15px;
    font-weight: 720;
    transition: background 0.18s, transform 0.18s, box-shadow 0.18s;
}

#btn-login:hover {
    background: #0b4e5a;
    box-shadow: 0 10px 24px rgba(15, 95, 109, 0.18);
    transform: translateY(-1px);
}

#btn-login:active {
    transform: translateY(0);
}

.login-note {
    margin-top: 28px;
    padding-top: 22px;
    border-top: 1px solid #eaecf0;
    color: #667085;
    font-size: 12px;
    line-height: 1.7;
}

.login-note strong {
    color: #344054;
}

@media (max-width: 980px) and (min-width: 521px) {
    body.login-page .container.content,
    body.login-page .container-centering {
        grid-template-columns: minmax(0, 56fr) minmax(300px, 44fr);
    }

    .brand-panel {
        padding: 34px 28px;
    }

    .brand-logo {
        margin-bottom: 34px;
        font-size: 16px;
    }

    .brand-logo-mark {
        width: 36px;
        height: 36px;
        border-radius: 10px;
    }

    .brand-title {
        font-size: 30px;
        line-height: 1.24;
    }

    .brand-summary {
        margin: 16px 0 24px;
        font-size: 13px;
        line-height: 1.7;
    }

    .brand-kicker {
        margin-bottom: 12px;
        font-size: 11px;
    }

    .capability-list {
        gap: 10px;
    }

    .capability-item {
        padding: 11px 12px;
        font-size: 12px;
        line-height: 1.5;
    }

    .login-panel {
        padding: 32px 22px;
    }

    .login-card {
        max-width: 300px;
    }

    .login-header {
        margin-bottom: 24px;
    }

    .login-header h1 {
        font-size: 25px;
    }

    .login-header p {
        font-size: 13px;
    }

    .login-note {
        margin-top: 20px;
        padding-top: 18px;
    }
}

@media (max-width: 520px) {
    body.login-page {
        overflow: auto;
    }

    body.login-page .container-centering {
        grid-template-columns: 1fr;
        height: auto;
        min-height: 100vh;
    }

    body.login-page .container.content {
        grid-template-columns: 1fr;
        height: auto;
        min-height: 100vh;
    }

    .brand-panel {
        min-height: 420px;
        padding: 40px 28px;
    }

    .brand-logo {
        margin-bottom: 42px;
    }

    .brand-title {
        font-size: 32px;
    }

    .brand-summary {
        margin-bottom: 26px;
    }

    .login-panel {
        padding: 40px 24px;
    }
}
</style>

<section class="brand-panel">
    <div class="brand-content">
        <div class="brand-logo">
            <span class="brand-logo-mark">P</span>
            <span>飞迭 PHIDIE</span>
        </div>

        <div class="brand-kicker">CUSTOMER OPERATIONS</div>
        <h1 class="brand-title">统一客户消息，清晰推进每一次跟进。</h1>
        <p class="brand-summary">
            面向邮件、网站询盘和客服消息的客户管理工作台，帮助团队识别客户需求、沉淀知识依据，并形成可确认的回复建议。
        </p>

        <div class="capability-list">
            <div class="capability-item">
                <span class="capability-dot"></span>
                <span>邮件、询盘、客服消息，自动归集。</span>
            </div>
            <div class="capability-item">
                <span class="capability-dot"></span>
                <span>自动标记客户类型、需求阶段和下一步动作。</span>
            </div>
            <div class="capability-item">
                <span class="capability-dot"></span>
                <span>结合企业知识库生成可确认的回复建议。</span>
            </div>
        </div>
    </div>
</section>

<section class="login-panel">
    <div class="login-card">
        <div class="login-header">
            <div class="login-label">PHIDIE CRM</div>
            <h1>登录系统</h1>
            <p>进入客户管理工作台，处理线索、消息与跟进任务。</p>
        </div>

        {{#if message}}
        <div class="phidie-message">{{message}}</div>
        {{/if}}

        <form id="login-form" autocomplete="on">
            <div class="phidie-form-group" data-name="username">
                <label for="field-userName">账号</label>
                <input
                    type="text"
                    name="username"
                    id="field-userName"
                    placeholder="请输入账号"
                    autocapitalize="off"
                    spellcheck="false"
                    tabindex="1"
                    autocomplete="username"
                    maxlength="255"
                >
            </div>

            <div class="phidie-form-group" data-name="password">
                <label for="field-password">密码</label>
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

            <button id="btn-login" type="button" tabindex="3">登录</button>
        </form>

        <p class="login-note">
            <strong>安全提示：</strong>请使用企业账号登录，所有回复建议需确认后再发送。
        </p>
    </div>
</section>
