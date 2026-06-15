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
    grid-template-columns: minmax(0, 60fr) minmax(420px, 40fr);
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background: #f6f8fb;
}

.pd-left {
    position: relative;
    display: flex;
    align-items: stretch;
    grid-column: 1;
    grid-row: 1;
    min-width: 0;
    overflow: hidden;
    padding: 56px;
    background:
        radial-gradient(circle at 28% 26%, rgba(255, 255, 255, 0.84), transparent 28%),
        radial-gradient(circle at 64% 30%, rgba(191, 219, 254, 0.9), transparent 34%),
        radial-gradient(circle at 74% 72%, rgba(251, 191, 36, 0.26), transparent 34%),
        linear-gradient(135deg, #dbeafe 0%, #e7eef7 48%, #f4efe7 100%);
    color: #111827;
}

.pd-left::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        radial-gradient(circle at 58% 46%, rgba(255, 255, 255, 0.5), transparent 16%),
        radial-gradient(circle at 68% 54%, rgba(37, 99, 235, 0.16), transparent 22%);
    opacity: 1;
}

.pd-left::after {
    content: "";
    position: absolute;
    right: 8%;
    top: 16%;
    width: 520px;
    height: 520px;
    border: 1px solid rgba(37, 99, 235, 0.16);
    border-radius: 50%;
    background:
        radial-gradient(circle at 34% 24%, rgba(255, 255, 255, 0.72), transparent 18%),
        conic-gradient(from 160deg, rgba(255, 255, 255, 0.55), rgba(147, 197, 253, 0.5), rgba(251, 191, 36, 0.24), rgba(255, 255, 255, 0.62));
    box-shadow: 0 42px 90px rgba(15, 23, 42, 0.16);
    opacity: 0.72;
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
    color: #111827;
    font-size: 18px;
    font-weight: 760;
}

.pd-brand-mark {
    position: relative;
    display: inline-flex;
    width: 42px;
    height: 42px;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
}

.pd-brand-mark::before {
    content: "";
    width: 42px;
    height: 42px;
    border: 1px solid rgba(148, 163, 184, 0.22);
    border-radius: 50%;
    background:
        conic-gradient(from 212deg at 48% 52%, rgba(219, 234, 254, 0.98), rgba(255, 255, 255, 0.94), rgba(254, 243, 199, 0.86), rgba(226, 232, 240, 0.82), rgba(219, 234, 254, 0.98)),
        radial-gradient(circle at 42% 48%, rgba(255, 255, 255, 0.98) 0 16%, transparent 18%),
        radial-gradient(circle at 58% 64%, rgba(37, 99, 235, 0.12) 0 7%, transparent 12%);
    box-shadow: inset 0 1px 12px rgba(255, 255, 255, 0.75), 0 8px 20px rgba(15, 23, 42, 0.07);
}

.pd-title {
    max-width: 520px;
    margin: 0;
    color: #111827;
    font-size: 48px;
    font-weight: 780;
    line-height: 1.15;
}

.pd-summary {
    max-width: 380px;
    margin: 22px 0 0;
    color: rgba(17, 24, 39, 0.68);
    font-size: 16px;
    line-height: 1.75;
}

.pd-summary span {
    position: relative;
    display: block;
    padding-left: 18px;
}

.pd-summary span::before {
    content: "";
    position: absolute;
    top: 0.85em;
    left: 0;
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: #93c5fd;
    box-shadow: 0 0 0 4px rgba(147, 197, 253, 0.18);
    transform: translateY(-50%);
}

.pd-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
}

.pd-tag {
    padding: 8px 12px;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.56);
    color: rgba(17, 24, 39, 0.72);
    font-size: 12px;
    font-weight: 650;
    text-align: center;
}

.pd-right {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    grid-column: 2;
    grid-row: 1;
    min-width: 0;
    min-height: 100vh;
    padding: 48px 64px;
    background: #fff;
}

.container-centering {
    position: absolute !important;
    inset: 0 !important;
    display: grid !important;
    place-items: center !important;
    width: 100% !important;
    height: 100% !important;
    margin: 0 !important;
    padding: 0 !important;
}

#login.panel {
    width: 100% !important;
    max-width: 400px !important;
    margin: 0 !important;
    border: 1px solid rgba(226, 232, 240, 0.95) !important;
    border-radius: 16px !important;
    background: rgba(255, 255, 255, 0.92) !important;
    box-shadow: 0 24px 70px rgba(15, 23, 42, 0.11), 0 2px 8px rgba(15, 23, 42, 0.04) !important;
    transform: translateY(-150px);
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
    border: 1px solid #d7dee8 !important;
    border-radius: 8px !important;
    outline: none !important;
    background: #fff !important;
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
    display: flex;
    align-items: center;
}

[data-role="password-input-container"] input {
    width: 100%;
    padding-right: 56px !important;
}

[data-action="toggleShowPassword"] {
    position: absolute !important;
    top: 0 !important;
    right: 12px !important;
    bottom: 0 !important;
    z-index: 2;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 32px !important;
    height: 100% !important;
    margin: auto 0 !important;
    color: #94a3b8 !important;
    line-height: 1 !important;
    text-decoration: none !important;
    transform: none !important;
}

[data-action="toggleShowPassword"] span {
    display: block;
    font-size: 18px;
    line-height: 1;
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
        grid-template-columns: minmax(0, 60fr) minmax(340px, 40fr);
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
        padding: 34px 36px;
    }

    #login.panel {
        max-width: 360px !important;
        transform: translateY(-30px);
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
        grid-column: 1;
        grid-row: 1;
        min-height: 300px;
        padding: 34px 24px;
    }

    .pd-right {
        grid-column: 1;
        grid-row: 2;
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

    #login.panel {
        transform: none;
    }

}
</style>

<div class="pd-split">
    <section class="pd-left">
        <div class="pd-brand-content">
            <div class="pd-brand">
                <span class="pd-brand-mark" aria-hidden="true"></span>
                <span>飞迭智客</span>
            </div>

            <div>
                <h1 class="pd-title">智能客户管理</h1>
                <p class="pd-summary">
                    <span>邮件、询盘、客服消息，自动归集</span>
                    <span>AI识别客户类型，自动分层</span>
                    <span>调取企业知识库，生成可确认的回复</span>
                </p>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer>{{{footer}}}</footer>
