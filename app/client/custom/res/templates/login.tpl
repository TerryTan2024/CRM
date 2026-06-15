<style>
*,
*::before,
*::after {
    box-sizing: border-box;
}

html,
body {
    min-height: 100%;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
    background: #f6f8fb !important;
    color: #111827;
    font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Microsoft YaHei", "Segoe UI", sans-serif;
}

body .navbar,
body footer,
body .page-footer {
    display: none !important;
}

body > .container.content,
body .container.content {
    position: fixed !important;
    inset: 0 !important;
    width: 100vw !important;
    max-width: none !important;
    height: 100vh !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden !important;
}

.pd-split {
    display: grid;
    grid-template-columns: minmax(0, 40fr) minmax(420px, 60fr);
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background: #f6f8fb;
}

.pd-left {
    position: relative;
    display: flex;
    align-items: stretch;
    min-width: 0;
    overflow: hidden;
    padding: 56px;
    background: linear-gradient(135deg, #08213d 0%, #0f3b66 54%, #145a8a 100%);
    color: #fff;
}

.pd-left::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(rgba(255, 255, 255, 0.055) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.055) 1px, transparent 1px);
    background-size: 48px 48px;
    opacity: 0.72;
}

.pd-left::after {
    content: "";
    position: absolute;
    right: -180px;
    bottom: -180px;
    width: 520px;
    height: 520px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 50%;
    background: radial-gradient(circle, rgba(96, 165, 250, 0.22), transparent 64%);
}

.pd-brand-content {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 100%;
    max-width: 560px;
}

.pd-brand {
    display: inline-flex;
    align-items: center;
    gap: 14px;
    color: #fff;
    font-size: 18px;
    font-weight: 760;
}

.pd-brand-mark {
    display: grid;
    width: 44px;
    height: 44px;
    place-items: center;
    border-radius: 10px;
    background: #fff;
    color: #1d4ed8;
    font-size: 20px;
    font-weight: 820;
}

.pd-kicker {
    margin-bottom: 16px;
    color: #bfdbfe;
    font-size: 12px;
    font-weight: 760;
    letter-spacing: 0.18em;
}

.pd-title {
    max-width: 520px;
    margin: 0;
    color: #fff;
    font-size: 48px;
    font-weight: 780;
    line-height: 1.15;
}

.pd-summary {
    max-width: 440px;
    margin: 22px 0 0;
    color: rgba(255, 255, 255, 0.74);
    font-size: 16px;
    line-height: 1.75;
}

.pd-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.pd-tag {
    min-width: 84px;
    padding: 10px 14px;
    border: 1px solid rgba(255, 255, 255, 0.16);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.86);
    font-size: 13px;
    font-weight: 650;
    text-align: center;
}

.pd-right {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 0;
    padding: 40px 56px;
    background: #f6f8fb;
}

.container-centering {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
}

#login.panel {
    width: 100% !important;
    max-width: 400px !important;
    margin: 0 !important;
    border: 1px solid #e5e7eb !important;
    border-radius: 10px !important;
    background: #fff !important;
    box-shadow: 0 18px 48px rgba(15, 23, 42, 0.08) !important;
}

#login .panel-heading {
    display: none !important;
}

#login .panel-body {
    padding: 34px 38px !important;
}

.pd-login-copy {
    margin-bottom: 22px;
}

.pd-login-label {
    margin-bottom: 10px;
    color: #1d4ed8;
    font-size: 12px;
    font-weight: 820;
    letter-spacing: 0.18em;
}

.pd-login-copy h1 {
    margin: 0;
    color: #111827;
    font-size: 30px;
    font-weight: 780;
    line-height: 1.2;
}

.pd-login-copy p {
    margin: 12px 0 0;
    color: #6b7280;
    font-size: 14px;
    line-height: 1.65;
}

.form-group {
    margin-bottom: 18px !important;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #374151;
    font-size: 13px !important;
    font-weight: 650 !important;
}

.form-control {
    width: 100%;
    height: 46px !important;
    padding: 0 14px !important;
    border: 1px solid #cbd5e1 !important;
    border-radius: 8px !important;
    outline: none !important;
    background: #f8fafc !important;
    color: #111827 !important;
    box-shadow: none !important;
    font-family: inherit !important;
    font-size: 14px !important;
    transition: border-color 0.18s, box-shadow 0.18s, background 0.18s;
}

.form-control:focus {
    border-color: #2563eb !important;
    background: #fff !important;
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.14) !important;
}

[data-role="password-input-container"] {
    position: relative;
    display: block;
}

[data-role="password-input-container"] input {
    padding-right: 44px !important;
}

[data-action="toggleShowPassword"] {
    position: absolute;
    top: 50%;
    right: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    color: #94a3b8;
    line-height: 1;
    text-decoration: none;
    transform: translateY(-50%);
}

[data-name="submit"] {
    margin-top: 10px !important;
}

#btn-login {
    width: 100% !important;
    height: 48px !important;
    border: none !important;
    border-radius: 8px !important;
    background: #1d4ed8 !important;
    color: #fff !important;
    cursor: pointer;
    font-family: inherit !important;
    font-size: 15px !important;
    font-weight: 720 !important;
    transition: background 0.18s, transform 0.18s, box-shadow 0.18s;
}

#btn-login:hover {
    background: #1e40af !important;
    box-shadow: 0 10px 24px rgba(29, 78, 216, 0.22) !important;
    transform: translateY(-1px);
}

.pd-login-note {
    margin: 22px 0 0;
    color: #9ca3af;
    font-size: 12px;
    line-height: 1.6;
}

.alert,
.message {
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
        grid-template-columns: minmax(0, 40fr) minmax(340px, 60fr);
    }

    .pd-left {
        padding: 36px;
    }

    .pd-title {
        font-size: 34px;
    }

    .pd-summary {
        font-size: 14px;
    }

    .pd-right {
        padding: 28px 32px;
    }

    #login.panel {
        max-width: 360px !important;
    }

    #login .panel-body {
        padding: 30px !important;
    }
}

@media (max-width: 520px) {
    html,
    body {
        overflow: auto !important;
    }

    body > .container.content,
    body .container.content,
    .pd-split {
        position: static !important;
        height: auto !important;
        min-height: 100vh;
    }

    .pd-split {
        grid-template-columns: 1fr;
    }

    .pd-left {
        min-height: 300px;
        padding: 34px 24px;
    }

    .pd-title {
        font-size: 32px;
    }

    .pd-tags {
        display: none;
    }

    .pd-right {
        padding: 32px 20px;
    }

    #login .panel-body {
        padding: 30px 24px !important;
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

            <div>
                <div class="pd-kicker">CUSTOMER OPERATIONS</div>
                <h1 class="pd-title">智能客户管理</h1>
                <p class="pd-summary">邮件、询盘、客服消息统一归集，跟进清晰可控。</p>
            </div>

            <div class="pd-tags" aria-hidden="true">
                <span class="pd-tag">邮件</span>
                <span class="pd-tag">询盘</span>
                <span class="pd-tag">客服</span>
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
                            <p>进入客户管理工作台。</p>
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
                        <p class="pd-login-note">回复建议需确认后再发送。</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer>{{{footer}}}</footer>
