<style>
@keyframes shimmer {
    0%   { background-position: -200% center; }
    100% { background-position:  200% center; }
}
@keyframes drift {
    0%   { transform: translateY(0); opacity: 0; }
    10%  { opacity: 1; }
    90%  { opacity: 1; }
    100% { transform: translateY(-100vh); opacity: 0; }
}
@keyframes scan {
    0%   { top: 0; opacity: 0; }
    5%   { opacity: 1; }
    95%  { opacity: 1; }
    100% { top: 100%; opacity: 0; }
}
@keyframes glow {
    0%,100% { opacity:.5; } 50% { opacity:1; }
}
@keyframes blink {
    0%,100% { opacity:1; } 50% { opacity:.3; }
}
@keyframes fadein {
    from { opacity:0; transform:translateY(12px); }
    to   { opacity:1; transform:translateY(0); }
}

/* 全局 */
*, *::before, *::after { box-sizing: border-box; }
body.login-page {
    margin: 0; padding: 0; overflow: hidden;
    font-family: -apple-system, BlinkMacSystemFont, 'PingFang SC',
                 'Microsoft YaHei', 'Inter', sans-serif;
    background: #050510;
}
body.login-page .navbar { display: none !important; }

/* EspoCRM 外层容器：全屏铺满 */
body.login-page .container.content {
    padding: 0 !important; margin: 0 !important;
    width: 100vw !important; max-width: 100vw !important;
    height: 100vh !important;
}

/* 分屏布局 */
.pd-split {
    display: flex;
    width: 100vw; height: 100vh;
}

/* ── 左侧 ── */
.pd-left {
    flex: 0 0 55%;
    background: #050510;
    position: relative;
    display: flex; flex-direction: column;
    justify-content: space-between;
    padding: 52px 64px;
    overflow: hidden;
}
.pd-left::before {
    content: '';
    position: absolute; inset: 0;
    background-image:
        linear-gradient(rgba(99,102,241,.07) 1px, transparent 1px),
        linear-gradient(90deg, rgba(99,102,241,.07) 1px, transparent 1px);
    background-size: 52px 52px;
    pointer-events: none;
}
.pd-scan {
    position: absolute; left:0; right:0; height:1px;
    background: linear-gradient(90deg,transparent,rgba(99,102,241,.7),transparent);
    animation: scan 7s linear infinite;
}
.pd-dots { position:absolute; inset:0; pointer-events:none; }
.pd-dot {
    position:absolute; bottom:-4px;
    width:2px; height:2px; border-radius:50%;
    background:rgba(139,92,246,.9);
    animation: drift linear infinite;
}
.pd-dot:nth-child(1){left:7%;  animation-duration:11s; animation-delay:0s;}
.pd-dot:nth-child(2){left:18%; animation-duration:9s;  animation-delay:2s;  width:3px;height:3px;}
.pd-dot:nth-child(3){left:31%; animation-duration:13s; animation-delay:1s;  background:rgba(99,102,241,.9);}
.pd-dot:nth-child(4){left:45%; animation-duration:10s; animation-delay:3.5s;}
.pd-dot:nth-child(5){left:58%; animation-duration:14s; animation-delay:.5s; width:3px;height:3px;}
.pd-dot:nth-child(6){left:70%; animation-duration:8s;  animation-delay:2.5s;background:rgba(99,102,241,.9);}
.pd-dot:nth-child(7){left:82%; animation-duration:12s; animation-delay:1.5s;}
.pd-dot:nth-child(8){left:91%; animation-duration:9s;  animation-delay:4s;  width:3px;height:3px;}
.pd-orb {
    position:absolute; border-radius:50%;
    filter:blur(90px); pointer-events:none;
    animation: glow 5s ease-in-out infinite;
}
.pd-orb-a { width:480px;height:480px; background:rgba(99,102,241,.13); top:-120px;right:-100px; }
.pd-orb-b { width:320px;height:320px; background:rgba(139,92,246,.1); bottom:20px;left:-80px; animation-delay:2.5s; }

.pd-brand { position:relative; z-index:2; }
.pd-brand-name {
    font-size:16px; font-weight:700; color:#fff;
    letter-spacing:2px; text-transform:uppercase;
}
.pd-brand-name .sep { margin:0 8px; color:#2a2a55; font-weight:300; }

.pd-hero {
    position:relative; z-index:2;
    text-align:center;
    animation: fadein .8s ease both;
}
.pd-tagline {
    font-size:50px; font-weight:800;
    line-height:1.2; letter-spacing:-2px;
    margin:0 0 16px;
    background: linear-gradient(120deg,#fff 0%,#fff 35%,#818cf8 60%,#c4b5fd 80%,#fff 100%);
    background-size:250% auto;
    -webkit-background-clip:text; -webkit-text-fill-color:transparent;
    background-clip:text;
    animation: shimmer 5s linear infinite;
}
.pd-sub { font-size:13px; color:#3d3d72; letter-spacing:3px; }

.pd-status { position:relative; z-index:2; }
.pd-status-row { display:flex; align-items:center; gap:8px; font-size:11px; color:#2d2d55; }
.pd-led {
    width:6px; height:6px; border-radius:50%;
    background:#22c55e; box-shadow:0 0 8px rgba(34,197,94,.9);
    animation: blink 2.5s ease-in-out infinite;
}

/* ── 右侧 ── */
.pd-right {
    flex: 0 0 45%;
    background: #fff;
    display: flex; align-items: center; justify-content: center;
    padding: 60px 48px;
    position: relative;
}
.pd-right::before {
    content:''; position:absolute; top:0; left:0; right:0; height:2px;
    background:linear-gradient(90deg,#6366f1,#a78bfa,#6366f1);
    background-size:200% auto;
    animation: shimmer 3s linear infinite;
}

/* EspoCRM 原始容器 → 透明化 */
body.login-page .container-centering {
    display:contents !important; /* 让子元素直接参与 pd-right 布局 */
}
body.login-page #login.panel {
    all: unset !important;
    display:flex !important; flex-direction:column !important;
    width:100% !important; max-width:340px !important;
    animation: fadein .6s ease both;
}
body.login-page #login .panel-heading { display:none !important; }
body.login-page #login .panel-body { padding:0 !important; }

/* 标题 */
body.login-page #login .panel-body::before {
    content:'欢迎回来';
    display:block;
    font-size:22px; font-weight:700; color:#09090b;
    letter-spacing:-.4px; margin-bottom:6px;
}
body.login-page #login .panel-body::after {
    content:'请登录您的账户以继续';
    display:block;
    font-size:13px; color:#a1a1aa; margin-bottom:28px;
}

/* 表单 */
body.login-page .form-group { margin-bottom:16px !important; }
body.login-page .form-group label {
    font-size:12px !important; font-weight:500 !important;
    color:#52525b !important; margin-bottom:6px !important;
}
body.login-page .form-control {
    height:44px !important; padding:0 14px !important;
    background:#fafafa !important; border:1px solid #e4e4e7 !important;
    border-radius:8px !important; font-size:14px !important;
    color:#09090b !important; box-shadow:none !important;
    transition:border-color .2s, box-shadow .2s !important;
    font-family:inherit !important;
}
body.login-page .form-control:focus {
    background:#fff !important; border-color:#6366f1 !important;
    box-shadow:0 0 0 3px rgba(99,102,241,.12) !important;
}
body.login-page .form-control::placeholder { color:#d4d4d8 !important; }

/* 密码眼睛按钮 */
body.login-page [data-role="password-input-container"] {
    position:relative !important; display:flex !important; align-items:center !important;
}
body.login-page [data-role="password-input-container"] input {
    flex:1 !important; padding-right:44px !important;
}
body.login-page [data-action="toggleShowPassword"] {
    position:absolute !important; right:12px !important;
    background:none !important; border:none !important;
    color:#94a3b8 !important; cursor:pointer !important;
    padding:4px !important; display:flex !important;
    font-size:16px !important;
}
body.login-page [data-action="toggleShowPassword"]:hover { color:#6366f1 !important; }

/* 提交区 */
body.login-page [data-name="submit"] { margin-top:8px !important; }
body.login-page [data-name="submit"] a.btn-link {
    font-size:12px !important; color:#6366f1 !important;
}

/* 登录按钮 */
body.login-page #btn-login {
    width:100% !important; height:44px !important;
    background:linear-gradient(135deg,#6366f1,#8b5cf6) !important;
    background-size:200% auto !important;
    color:#fff !important; border:none !important;
    border-radius:8px !important; font-size:14px !important;
    font-weight:600 !important; cursor:pointer !important;
    font-family:inherit !important; letter-spacing:.3px !important;
    box-shadow:0 4px 20px rgba(99,102,241,.35) !important;
    transition:transform .15s, box-shadow .2s !important;
    animation:shimmer 3s linear infinite !important;
    display:block !important;
}
body.login-page #btn-login:hover {
    transform:translateY(-2px) !important;
    box-shadow:0 8px 30px rgba(99,102,241,.5) !important;
}

/* 错误提示 */
body.login-page .alert, body.login-page .message {
    background:#fff1f1 !important; border:1px solid #fca5a5 !important;
    border-left:3px solid #ef4444 !important;
    color:#dc2626 !important; font-size:13px !important;
    padding:10px 14px !important; border-radius:8px !important;
    margin-bottom:16px !important;
}
/* EspoCRM 通知 Toast 层级 */
body.login-page .notifications-container,
body.login-page .notification-container,
.growl-container, #growl-container,
.espo-message-container {
    z-index:999999 !important;
}

/* footer */
body.login-page footer { display:none !important; }

@media (max-width:820px) {
    .pd-split { flex-direction:column; }
    .pd-left  { flex:0 0 180px; padding:28px 32px; }
    .pd-tagline { font-size:28px; }
    .pd-dots,.pd-orb { display:none; }
    .pd-right { flex:1; }
}
</style>

<div class="pd-split">
    <!-- ── 左侧 ── -->
    <div class="pd-left">
        <div class="pd-scan"></div>
        <div class="pd-dots">
            <div class="pd-dot"></div><div class="pd-dot"></div>
            <div class="pd-dot"></div><div class="pd-dot"></div>
            <div class="pd-dot"></div><div class="pd-dot"></div>
            <div class="pd-dot"></div><div class="pd-dot"></div>
        </div>
        <div class="pd-orb pd-orb-a"></div>
        <div class="pd-orb pd-orb-b"></div>

        <div class="pd-brand">
            <div class="pd-brand-name">飞迭<span class="sep">|</span>PHIDIE</div>
        </div>
        <div class="pd-hero">
            <div class="pd-tagline">客户管理系统</div>
            <div class="pd-sub">智能 · 高效 · 驱动增长</div>
        </div>
        <div class="pd-status">
            <div class="pd-status-row">
                <div class="pd-led"></div>
                所有系统正常运行
            </div>
        </div>
    </div>

    <!-- ── 右侧：EspoCRM 原始表单（结构完整，JS 事件不变）── -->
    <div class="pd-right">
        <div class="container-centering">
        <div id="login" class="panel panel-default block-center-sm">
            <div class="panel-heading">
                <div class="logo-container">
                    <img src="{{logoSrc}}" class="logo" style="display:none">
                </div>
            </div>
            <div class="panel-body">
                <div class="">
                    <form id="login-form">
                        <div class="form-group cell" data-name="username">
                            <label for="field-userName">用户名</label>
                            <input type="text" name="username" id="field-userName"
                                class="form-control" autocapitalize="off"
                                spellcheck="false" tabindex="1"
                                autocomplete="username" maxlength="255"
                                placeholder="请输入用户名">
                        </div>
                        <div class="form-group cell" data-name="password">
                            <label for="field-password">密码</label>
                            <div data-role="password-input-container">
                                <input type="password" name="password" id="field-password"
                                    class="form-control" tabindex="2"
                                    autocomplete="current-password" maxlength="255"
                                    placeholder="请输入密码">
                                <a role="button" data-action="toggleShowPassword"
                                    class="text-soft" title="查看密码">
                                    <span class="far fa-eye"></span>
                                </a>
                            </div>
                        </div>
                        <div class="margin-top-2x cell" data-name="submit">
                            <button type="submit" class="btn btn-primary btn-s-wide"
                                id="btn-login" tabindex="3">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<footer>{{{footer}}}</footer>
