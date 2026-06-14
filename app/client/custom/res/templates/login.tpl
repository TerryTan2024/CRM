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
    background: #eef3f8;
    color: #172033;
    font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Microsoft YaHei", "Segoe UI", sans-serif;
}

body.login-page .container.content {
    width: 100%;
    max-width: none;
    margin: 0;
    padding: 0;
}

body.login-page .container-centering {
    display: grid;
    grid-template-columns: minmax(520px, 1fr) minmax(420px, 520px);
    min-height: 100vh;
}

.phidie-stage {
    position: relative;
    display: flex;
    align-items: center;
    overflow: hidden;
    padding: 56px 64px;
    background:
        linear-gradient(135deg, rgba(13, 42, 69, 0.94), rgba(20, 82, 96, 0.9)),
        linear-gradient(90deg, #0f1f34, #146a75);
}

.phidie-stage::before {
    content: "";
    position: absolute;
    inset: 0;
    background-image:
        linear-gradient(rgba(255, 255, 255, 0.055) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.055) 1px, transparent 1px);
    background-size: 42px 42px;
    mask-image: linear-gradient(90deg, #000 0%, transparent 85%);
}

.phidie-stage-inner {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 720px;
}

.brand-mark {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 64px;
    color: #fff;
    font-size: 18px;
    font-weight: 700;
    letter-spacing: 0.02em;
}

.brand-mark-icon {
    display: grid;
    width: 42px;
    height: 42px;
    place-items: center;
    border-radius: 10px;
    background: #ffffff;
    color: #126172;
    font-weight: 900;
}

.stage-eyebrow {
    margin-bottom: 18px;
    color: #9ee6d6;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.18em;
}

.stage-title {
    max-width: 640px;
    margin: 0 0 20px;
    color: #fff;
    font-size: 44px;
    font-weight: 760;
    line-height: 1.14;
}

.stage-copy {
    max-width: 620px;
    margin: 0 0 44px;
    color: rgba(255, 255, 255, 0.76);
    font-size: 16px;
    line-height: 1.8;
}

.workflow {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 14px;
    max-width: 680px;
}

.workflow-step {
    min-height: 142px;
    padding: 18px;
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(14px);
}

.workflow-step strong {
    display: block;
    margin-bottom: 10px;
    color: #fff;
    font-size: 15px;
}

.workflow-step span {
    color: rgba(255, 255, 255, 0.68);
    font-size: 13px;
    line-height: 1.65;
}

.login-pane {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 48px;
    background: #fbfcfe;
}

.login-box {
    width: 100%;
    max-width: 380px;
}

.login-box-header {
    margin-bottom: 34px;
}

.login-product {
    margin-bottom: 12px;
    color: #126172;
    font-size: 14px;
    font-weight: 700;
    letter-spacing: 0.16em;
}

.login-box h1 {
    margin: 0 0 10px;
    color: #111827;
    font-size: 28px;
    font-weight: 760;
}

.login-box p {
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
    color: #111827;
    font-size: 14px;
    transition: border-color 0.18s, box-shadow 0.18s;
}

.phidie-form-group input:focus {
    border-color: #139283;
    box-shadow: 0 0 0 3px rgba(19, 146, 131, 0.13);
}

#btn-login {
    width: 100%;
    height: 48px;
    margin-top: 8px;
    border: none;
    border-radius: 8px;
    background: #126172;
    color: #fff;
    cursor: pointer;
    font-family: inherit;
    font-size: 15px;
    font-weight: 700;
    transition: background 0.18s, transform 0.18s;
}

#btn-login:hover {
    background: #0f5060;
    transform: translateY(-1px);
}

#btn-login:active {
    transform: translateY(0);
}

.assurance {
    display: grid;
    gap: 8px;
    margin-top: 28px;
    padding-top: 24px;
    border-top: 1px solid #eaecf0;
    color: #667085;
    font-size: 12px;
    line-height: 1.6;
}

.assurance b {
    color: #344054;
}

@media (max-width: 980px) {
    body.login-page .container-centering {
        grid-template-columns: 1fr;
    }

    .phidie-stage {
        padding: 36px 28px;
    }

    .brand-mark {
        margin-bottom: 34px;
    }

    .stage-title {
        font-size: 32px;
    }

    .workflow {
        grid-template-columns: 1fr;
    }

    .workflow-step {
        min-height: auto;
    }

    .login-pane {
        padding: 38px 24px;
    }
}
</style>

<section class="phidie-stage">
    <div class="phidie-stage-inner">
        <div class="brand-mark">
            <span class="brand-mark-icon">P</span>
            <span>飞迭 PHIDIE</span>
        </div>

        <div class="stage-eyebrow">INTELLIGENT CUSTOMER MANAGEMENT</div>
        <h1 class="stage-title">把客户邮件、网站询盘和客服消息汇成一条可跟进的客户线索。</h1>
        <p class="stage-copy">
            系统识别客户类型、需求阶段和下一步动作，并基于企业知识库生成可确认的回复建议，让销售、客服与技术支持在同一个工作台协作。
        </p>

        <div class="workflow" aria-label="核心流程">
            <div class="workflow-step">
                <strong>统一进入</strong>
                <span>邮件、询盘、客服会话沉淀到客户记录，减少分散沟通和重复录入。</span>
            </div>
            <div class="workflow-step">
                <strong>自动识别</strong>
                <span>标记客户类型、需求阶段、紧急程度和下一步动作，方便分派跟进。</span>
            </div>
            <div class="workflow-step">
                <strong>确认回复</strong>
                <span>结合知识库生成回复草稿，由人员确认后再发送，避免不可控自动答复。</span>
            </div>
        </div>
    </div>
</section>

<section class="login-pane">
    <div class="login-box">
        <div class="login-box-header">
            <div class="login-product">PHIDIE CRM</div>
            <h1>登录工作台</h1>
            <p>查看客户线索、处理客户消息，并确认系统生成的回复建议。</p>
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

        <div class="assurance">
            <span><b>人工确认优先：</b>AI 回复只作为建议，确认后才进入正式沟通。</span>
            <span><b>知识库驱动：</b>建议内容保留依据，便于销售与客服核对。</span>
        </div>
    </div>
</section>
