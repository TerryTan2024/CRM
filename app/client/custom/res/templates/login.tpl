<style>
*,
*::before,
*::after {
    box-sizing: border-box;
}

html,
body {
    min-height: 100%;
}

body.login-page {
    margin: 0;
    overflow: hidden;
    background: #fbfcfe;
    color: #101828;
    font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Microsoft YaHei", "Segoe UI", sans-serif;
}

body.login-page .navbar,
body.login-page footer {
    display: none !important;
}

body.login-page .container.content {
    width: 100vw !important;
    max-width: none !important;
    height: 100vh !important;
    margin: 0 !important;
    padding: 0 !important;
}

.pd-split {
    display: grid;
    grid-template-columns: minmax(0, 58fr) minmax(320px, 42fr);
    width: 100vw;
    height: 100vh;
    overflow: hidden;
}

.pd-left {
    position: relative;
    display: flex;
    align-items: center;
    overflow: hidden;
    padding: 64px;
    background:
        linear-gradient(135deg, rgba(10, 27, 47, 0.96), rgba(15, 78, 91, 0.92)),
        #0b1f34;
}

.pd-left::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(rgba(255, 255, 255, 0.055) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.055) 1px, transparent 1px);
    background-size: 44px 44px;
    opacity: 0.82;
}

.pd-left::after {
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

.pd-brand-content {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 620px;
}

.pd-brand {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 72px;
    color: #fff;
    font-size: 18px;
    font-weight: 720;
}

.pd-brand-mark {
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

.pd-kicker {
    margin-bottom: 16px;
    color: #8fe4d8;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.18em;
}

.pd-title {
    max-width: 580px;
    margin: 0;
    color: #fff;
    font-size: 42px;
    font-weight: 760;
    line-height: 1.18;
}

.pd-summary {
    max-width: 560px;
    margin: 22px 0 42px;
    color: rgba(255, 255, 255, 0.72);
    font-size: 15px;
    line-height: 1.85;
}

.pd-capability-list {
    display: grid;
    gap: 12px;
    max-width: 520px;
}

.pd-capability-item {
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

.pd-dot {
    flex: 0 0 auto;
    width: 8px;
    height: 8px;
    margin-top: 6px;
    border-radius: 50%;
    background: #8fe4d8;
    box-shadow: 0 0 0 4px rgba(143, 228, 216, 0.12);
}

.pd-right {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 0;
    padding: 56px 48px;
    background: #fbfcfe;
}

body.login-page .container-centering {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
}

body.login-page #login.panel {
    width: 100% !important;
    max-width: 380px !important;
    margin: 0 !important;
    border: 0 !important;
    background: transparent !important;
    box-shadow: none !important;
}

body.login-page #login .panel-heading {
    display: none !important;
}

body.login-page #login .panel-body {
    padding: 0 !important;
}

.pd-login-copy {
    margin-bottom: 28px;
}

.pd-login-label {
    margin-bottom: 12px;
    color: #0f5f6d;
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 0.16em;
}

.pd-login-copy h1 {
    margin: 0 0 10px;
    color: #101828;
    font-size: 28px;
    font-weight: 760;
}

.pd-login-copy p {
    margin: 0;
    color: #667085;
    font-size: 14px;
    line-height: 1.7;
}

.pd-login-note {
    margin-top: 28px;
    padding-top: 22px;
    border-top: 1px solid #eaecf0;
    color: #667085;
    font-size: 12px;
    line-height: 1.7;
}

body.login-page .form-group {
    margin-bottom: 18px !important;
}

body.login-page .form-group label {
    display: block;
    margin-bottom: 8px;
    color: #344054;
    font-size: 13px !important;
    font-weight: 650 !important;
}

body.login-page .form-control {
    width: 100%;
    height: 46px !important;
    padding: 0 14px !important;
    border: 1px solid #d0d5dd !important;
    border-radius: 8px !important;
    outline: none !important;
    background: #fff !important;
    color: #101828 !important;
    box-shadow: none !important;
    font-family: inherit !important;
    font-size: 14px !important;
    transition: border-color 0.18s, box-shadow 0.18s;
}

body.login-page .form-control:focus {
    border-color: #0f8a7d !important;
    box-shadow: 0 0 0 3px rgba(15, 138, 125, 0.14) !important;
}

body.login-page [data-role="password-input-container"] {
    position: relative;
}

body.login-page [data-role="password-input-container"] input {
    padding-right: 44px !important;
}

body.login-page [data-action="toggleShowPassword"] {
    position: absolute;
    top: 50%;
    right: 12px;
    color: #98a2b3;
    transform: translateY(-50%);
}

body.login-page [data-name="submit"] {
    margin-top: 8px !important;
}

body.login-page #btn-login {
    width: 100% !important;
    height: 48px !important;
    border: none !important;
    border-radius: 8px !important;
    background: #0f5f6d !important;
    color: #fff !important;
    cursor: pointer;
    font-family: inherit !important;
    font-size: 15px !important;
    font-weight: 720 !important;
    transition: background 0.18s, transform 0.18s, box-shadow 0.18s;
}

body.login-page #btn-login:hover {
    background: #0b4e5a !important;
    box-shadow: 0 10px 24px rgba(15, 95, 109, 0.18) !important;
    transform: translateY(-1px);
}

body.login-page .alert,
body.login-page .message {
    margin-bottom: 18px !important;
    padding: 12px 14px !important;
    border: 1px solid #fecaca !important;
    border-left: 3px solid #ef4444 !important;
    border-radius: 8px !important;
    background: #fff1f2 !important;
    color: #991b1b !important;
    font-size: 13px !important;
}

@media (max-width: 980px) and (min-width: 521px) {
    .pd-split {
        grid-template-columns: minmax(0, 56fr) minmax(300px, 44fr);
    }

    .pd-left {
        padding: 34px 28px;
    }

    .pd-brand {
        margin-bottom: 34px;
        font-size: 16px;
    }

    .pd-brand-mark {
        width: 36px;
        height: 36px;
        border-radius: 10px;
    }

    .pd-title {
        font-size: 30px;
        line-height: 1.24;
    }

    .pd-summary {
        margin: 16px 0 24px;
        font-size: 13px;
        line-height: 1.7;
    }

    .pd-kicker {
        margin-bottom: 12px;
        font-size: 11px;
    }

    .pd-capability-list {
        gap: 10px;
    }

    .pd-capability-item {
        padding: 11px 12px;
        font-size: 12px;
        line-height: 1.5;
    }

    .pd-right {
        padding: 32px 22px;
    }

    body.login-page #login.panel {
        max-width: 300px !important;
    }

    .pd-login-copy h1 {
        font-size: 25px;
    }
}

@media (max-width: 520px) {
    body.login-page {
        overflow: auto;
    }

    body.login-page .container.content,
    .pd-split {
        height: auto !important;
        min-height: 100vh;
    }

    .pd-split {
        grid-template-columns: 1fr;
    }

    .pd-left {
        min-height: 420px;
        padding: 40px 28px;
    }

    .pd-title {
        font-size: 32px;
    }

    .pd-right {
        padding: 40px 24px;
    }
}
</style>

<div class="pd-split">
    <section class="pd-left">
        <div class="pd-brand-content">
            <div class="pd-brand">
                <span class="pd-brand-mark">P</span>
                <span>飞迭 PHIDIE</span>
            </div>

            <div class="pd-kicker">CUSTOMER OPERATIONS</div>
            <h1 class="pd-title">统一客户消息，清晰推进每一次跟进。</h1>
            <p class="pd-summary">
                面向邮件、网站询盘和客服消息的客户管理工作台，帮助团队识别客户需求、沉淀知识依据，并形成可确认的回复建议。
            </p>

            <div class="pd-capability-list">
                <div class="pd-capability-item">
                    <span class="pd-dot"></span>
                    <span>邮件、询盘、客服消息，自动归集。</span>
                </div>
                <div class="pd-capability-item">
                    <span class="pd-dot"></span>
                    <span>自动标记客户类型、需求阶段和下一步动作。</span>
                </div>
                <div class="pd-capability-item">
                    <span class="pd-dot"></span>
                    <span>结合企业知识库生成可确认的回复建议。</span>
                </div>
            </div>
        </div>
    </section>

    <section class="pd-right">
        <div class="container-centering">
            <div id="login" class="panel panel-default block-center-sm">
                <div class="panel-heading">
                    <div class="logo-container">
                        <img src="{{logoSrc}}" class="logo" style="display:none">
                    </div>
                </div>
                <div class="panel-body">
                    <div>
                        <div class="pd-login-copy">
                            <div class="pd-login-label">PHIDIE CRM</div>
                            <h1>登录系统</h1>
                            <p>进入客户管理工作台，处理线索、消息与跟进任务。</p>
                        </div>
                        <form id="login-form">
                            <div class="form-group cell" data-name="username">
                                <label for="field-userName">账号</label>
                                <input
                                    type="text"
                                    name="username"
                                    id="field-userName"
                                    class="form-control"
                                    autocapitalize="off"
                                    spellcheck="false"
                                    tabindex="1"
                                    autocomplete="username"
                                    maxlength="255"
                                    placeholder="请输入账号"
                                >
                            </div>

                            <div class="form-group cell" data-name="password">
                                <label for="field-password">密码</label>
                                <div data-role="password-input-container">
                                    <input
                                        type="password"
                                        name="password"
                                        id="field-password"
                                        class="form-control"
                                        tabindex="2"
                                        autocomplete="current-password"
                                        maxlength="255"
                                        placeholder="请输入密码"
                                    >
                                    <a
                                        role="button"
                                        data-action="toggleShowPassword"
                                        class="text-soft"
                                        title="查看密码"
                                    >
                                        <span class="far fa-eye"></span>
                                    </a>
                                </div>
                            </div>

                            <div class="margin-top-2x cell" data-name="submit">
                                <button
                                    type="submit"
                                    class="btn btn-primary btn-s-wide"
                                    id="btn-login"
                                    tabindex="3"
                                >登录</button>
                            </div>
                        </form>
                        <p class="pd-login-note">安全提示：请使用企业账号登录，所有回复建议需确认后再发送。</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer>{{{footer}}}</footer>
