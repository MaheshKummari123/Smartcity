<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity Portal – Login & Register</title>
    <link
        href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500;600&display=swap"
        rel="stylesheet">
    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --bg1: #0a1628;
            --bg2: #0d1f3c;
            --bg3: #0f2347;
            --accent: #00c8ff;
            --accent2: #0084b4;
            --accent3: #00e5b0;
            --city-glow: rgba(0, 200, 255, 0.18);
            --card-bg: rgba(10, 28, 58, 0.85);
            --card-border: rgba(0, 180, 255, 0.18);
            --input-bg: rgba(5, 18, 40, 0.8);
            --input-border: rgba(0, 160, 220, 0.3);
            --text-white: #e8f4ff;
            --text-muted: rgba(180, 220, 255, 0.55);
            --text-label: rgba(180, 220, 255, 0.85);
        }
        html{
            overflow-y: scroll;
        }

        body {
    font-family: 'DM Sans', sans-serif;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    padding-top: 30px;
    padding-bottom: 80px;
    background: radial-gradient(ellipse at 50% 0%, #0d2a52 0%, #071428 55%, #050e1e 100%);
    position: relative;
    overflow-x: hidden;
    overflow-y: scroll;
}

        /* Grid lines */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(0, 180, 255, 0.05) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 180, 255, 0.05) 1px, transparent 1px);
            background-size: 50px 50px;
            pointer-events: none;
            z-index: 0;
        }

        /* Animated scan line */
        body::after {
            content: '';
            position: fixed;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(0, 200, 255, 0.4), transparent);
            animation: scan 6s linear infinite;
            z-index: 1;
            pointer-events: none;
        }

        @keyframes scan {
            0% {
                top: -2px;
            }

            100% {
                top: 100vh;
            }
        }

        /* City skyline SVG */
        .city-skyline {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 2;
            pointer-events: none;
        }

        /* Glowing orb behind card */
        .orb {
            position: fixed;
            width: 560px;
            height: 560px;
            border-radius: 50%;
            background: radial-gradient(circle at 50% 50%, rgba(0, 180, 255, 0.12) 0%, rgba(0, 100, 180, 0.06) 50%, transparent 75%);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -46%);
            z-index: 2;
            pointer-events: none;
        }

        .orb-ring {
            position: fixed;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            border: 1px solid rgba(0, 200, 255, 0.12);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -46%);
            z-index: 2;
            pointer-events: none;
            animation: pulse-ring 4s ease-in-out infinite;
        }

        .orb-ring2 {
            width: 620px;
            height: 620px;
            border-color: rgba(0, 200, 255, 0.06);
            animation-delay: 1.5s;
        }

        @keyframes pulse-ring {

            0%,
            100% {
                opacity: 0.4;
                transform: translate(-50%, -46%) scale(1);
            }

            50% {
                opacity: 0.9;
                transform: translate(-50%, -46%) scale(1.02);
            }
        }

        /* Floating data nodes */
        .node {
            position: fixed;
            border-radius: 50%;
            pointer-events: none;
            z-index: 2;
        }

        .node::after {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 50%;
            background: inherit;
            animation: node-pulse 3s ease-in-out infinite;
        }

        @keyframes node-pulse {

            0%,
            100% {
                transform: scale(1);
                opacity: 0.8;
            }

            50% {
                transform: scale(1.4);
                opacity: 0.2;
            }
        }

        /* Side text panels */
        .side-panel {
            position: fixed;
            z-index: 3;
            pointer-events: none;
            writing-mode: vertical-rl;
            font-family: 'Syne', sans-serif;
            font-size: 0.72rem;
            font-weight: 600;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: rgba(0, 200, 255, 0.25);
        }

        .side-panel-left {
            left: 4%;
            top: 50%;
            transform: translateY(-50%);
        }

        .side-panel-right {
            right: 4%;
            top: 50%;
            transform: translateY(-50%) rotate(180deg);
        }

        .side-stat {
            font-size: 0.65rem;
            color: rgba(0, 200, 255, 0.18);
            letter-spacing: 0.15em;
            margin-top: 20px;
        }

        /* Page title */
        .page-title {
            position: relative;
            z-index: 10;
            text-align: center;
            margin-bottom: 24px;
            font-family: 'Syne', sans-serif;
        }

        .page-title .pre {
            font-size: 0.75rem;
            letter-spacing: 0.3em;
            text-transform: uppercase;
            color: var(--accent);
            opacity: 0.7;
            margin-bottom: 6px;
            display: block;
        }

        .page-title h1 {
            font-size: 1.9rem;
            font-weight: 800;
            color: var(--text-white);
            letter-spacing: -0.02em;
            line-height: 1.1;
        }

        .page-title h1 span {
            background: linear-gradient(90deg, #00c8ff, #00e5b0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Card */
        .card-wrapper {
            position: relative;
            z-index: 10;
        }

        .card {
            background: linear-gradient(160deg, rgba(10, 30, 60, 0.92) 0%, rgba(8, 22, 46, 0.96) 100%);
            border-radius: 20px;
            padding: 34px 38px 36px;
            width: 440px;
            /* max-height: 80vh;
            overflow-y: auto   ; */

            /* min-height: 320px;
            height: auto; */

            box-shadow:
                0 0 0 1px rgba(0, 180, 255, 0.14),
                0 20px 60px rgba(0, 10, 30, 0.7),
                0 0 80px rgba(0, 150, 255, 0.06),
                inset 0 1px 0 rgba(0, 200, 255, 0.1);
            backdrop-filter: blur(20px);
        }

        /* App icon */
        .app-icon {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            background: linear-gradient(135deg, #0a2a52, #0d3a6e);
            border: 1.5px solid rgba(0, 200, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            box-shadow: 0 4px 20px rgba(0, 150, 255, 0.25), 0 0 30px rgba(0, 200, 255, 0.1);
        }

        .card-title {
            text-align: center;
            color: var(--text-white);
            font-family: 'Syne', sans-serif;
            font-size: 1.12rem;
            font-weight: 600;
            letter-spacing: 0.01em;
            margin-bottom: 6px;
        }

        .card-subtitle {
            text-align: center;
            color: var(--text-muted);
            font-size: 0.8rem;
            margin-bottom: 26px;
        }

        /* Tabs */
        .tabs {
            display: flex;
            background: rgba(0, 10, 28, 0.6);
            border-radius: 10px;
            padding: 4px;
            margin-bottom: 26px;
            border: 1px solid rgba(0, 150, 220, 0.15);
        }

        .tab {
            flex: 1;
            padding: 9px;
            text-align: center;
            font-family: 'DM Sans', sans-serif;
            font-size: 0.87rem;
            font-weight: 500;
            color: var(--text-muted);
            border-radius: 7px;
            cursor: pointer;
            transition: all 0.25s;
            border: none;
            background: transparent;
        }

        .tab.active {
            background: linear-gradient(135deg, rgba(0, 160, 220, 0.25), rgba(0, 120, 180, 0.2));
            color: var(--accent);
            box-shadow: 0 0 0 1px rgba(0, 200, 255, 0.2), 0 2px 10px rgba(0, 100, 200, 0.15);
        }

        /* Form panels */
        .form-panel {
            display: none;
        }

        .form-panel.active {
            display: block;
        }

        /* Form fields */
        .form-group {
            margin-bottom: 16px;
        }

        .form-row {
            display: flex;
            gap: 12px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-label {
            display: block;
            color: var(--text-label);
            font-size: 0.78rem;
            font-weight: 500;
            margin-bottom: 7px;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }

        .input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 13px;
            color: rgba(0, 180, 255, 0.45);
            display: flex;
            align-items: center;
            pointer-events: none;
        }

        .input-icon-right {
            position: absolute;
            right: 13px;
            color: rgba(0, 180, 255, 0.45);
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: color 0.2s;
        }

        .input-icon-right:hover {
            color: var(--accent);
        }

        input[type="email"],
        input[type="password"],
        input[type="text"],
        select {
            width: 100%;
            background: rgba(3, 12, 30, 0.75);
            border: 1.5px solid rgba(0, 160, 220, 0.22);
            border-radius: 9px;
            color: var(--text-white);
            font-family: 'DM Sans', sans-serif;
            font-size: 0.9rem;
            padding: 12px 42px 12px 40px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
        }

        select {
            padding-left: 40px;
            cursor: pointer;
            appearance: none;
        }

        select option {
            background: #0a1e40;
        }

        input:focus,
        select:focus {
            border-color: rgba(0, 200, 255, 0.5);
            background: rgba(3, 12, 30, 0.92);
            box-shadow: 0 0 0 3px rgba(0, 200, 255, 0.07);
        }

        input::placeholder {
            color: rgba(100, 170, 220, 0.3);
        }

        /* Checkbox row */
        .checkbox-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 14px 0 20px;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 9px;
            color: var(--text-muted);
            font-size: 0.83rem;
            cursor: pointer;
            user-select: none;
        }

        .custom-checkbox {
            width: 17px;
            height: 17px;
            border: 1.5px solid rgba(0, 180, 255, 0.35);
            border-radius: 4px;
            background: rgba(0, 10, 30, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            flex-shrink: 0;
        }

        input[type="checkbox"] {
            display: none;
        }

        .forgot-link {
            color: var(--accent);
            font-size: 0.82rem;
            text-decoration: none;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.2s;
        }

        .forgot-link:hover {
            opacity: 1;
        }

        /* Terms checkbox */
        .terms-row {
            display: flex;
            align-items: flex-start;
            gap: 9px;
            margin-bottom: 20px;
            color: var(--text-muted);
            font-size: 0.82rem;
            line-height: 1.45;
        }

        .terms-row .custom-checkbox {
            margin-top: 2px;
        }

        .terms-link {
            color: var(--accent);
            cursor: pointer;
            opacity: 0.8;
            text-decoration: underline;
            text-underline-offset: 2px;
        }

        /* Buttons */
        .btn-primary {
            width: 100%;
            padding: 13px;
            border-radius: 50px;
            border: none;
            background: linear-gradient(90deg, #00b8e8 0%, #008ec4 50%, #0078b0 100%);
            color: white;
            font-family: 'Syne', sans-serif;
            font-size: 0.95rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            cursor: pointer;
            transition: opacity 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 4px 20px rgba(0, 150, 220, 0.35), 0 0 40px rgba(0, 180, 255, 0.1);
            text-transform: uppercase;
        }

        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-1px);
            box-shadow: 0 6px 28px rgba(0, 150, 220, 0.45);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        /* OR divider */
        .or-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 18px 0;
            color: rgba(0, 180, 255, 0.3);
            font-size: 0.72rem;
            letter-spacing: 0.2em;
        }

        .or-divider::before,
        .or-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(0, 180, 255, 0.15);
        }

        /* Social buttons */
        .social-row {
            display: flex;
            gap: 10px;
        }

        .btn-social {
            flex: 1;
            padding: 11px;
            border-radius: 50px;
            border: 1.5px solid rgba(200, 220, 240, 0.15);
            background: rgba(255, 255, 255, 0.95);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .btn-social:hover {
            background: #f0f6ff;
            transform: translateY(-1px);
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.25);
        }

        .btn-social svg {
            width: 20px;
            height: 20px;
        }

        /* Password strength */
        .pwd-strength {
            margin-top: 6px;
            display: flex;
            gap: 4px;
        }

        .pwd-bar {
            flex: 1;
            height: 3px;
            border-radius: 2px;
            background: rgba(0, 180, 255, 0.1);
            transition: background 0.3s;
        }

        .pwd-bar.weak {
            background: #e84444;
        }

        .pwd-bar.medium {
            background: #e8a444;
        }

        .pwd-bar.strong {
            background: #00e5b0;
        }

        /* Trusted bar */
        .trusted-bar {
            position: relative;
            z-index: 10;
            margin-top: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .avatar-stack {
            display: flex;
        }

        .avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid rgba(0, 150, 255, 0.4);
            margin-left: -7px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.65rem;
            font-weight: 700;
            color: white;
        }

        .avatar:first-child {
            margin-left: 0;
        }

        .avatar:nth-child(1) {
            background: linear-gradient(135deg, #0a6090, #052a50);
        }

        .avatar:nth-child(2) {
            background: linear-gradient(135deg, #0a8060, #053a28);
        }

        .avatar:nth-child(3) {
            background: linear-gradient(135deg, #604090, #280540);
        }

        .avatar:nth-child(4) {
            background: linear-gradient(135deg, #906010, #503000);
        }

        .trusted-text {
            color: rgba(150, 210, 255, 0.6);
            font-size: 0.78rem;
            font-weight: 500;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(22px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .page-title {
            animation: fadeInUp 0.5s ease both;
            animation-delay: 0.05s;
        }

        .card-wrapper {
            animation: fadeInUp 0.6s ease both;
            animation-delay: 0.1s;
        }

        .trusted-bar {
            animation: fadeInUp 0.6s ease both;
            animation-delay: 0.2s;
        }

        /* Live city stats ticker */
        .stats-ticker {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 10;
            background: rgba(0, 5, 18, 0.75);
            border-top: 1px solid rgba(0, 180, 255, 0.1);
            padding: 8px 20px;
            display: flex;
            align-items: center;
            gap: 30px;
            overflow: hidden;
        }

        .ticker-label {
            font-family: 'Syne', sans-serif;
            font-size: 0.65rem;
            font-weight: 700;
            letter-spacing: 0.2em;
            color: var(--accent);
            text-transform: uppercase;
            white-space: nowrap;
            opacity: 0.7;
        }

        .ticker-items {
            display: flex;
            gap: 40px;
            animation: ticker 25s linear infinite;
            white-space: nowrap;
        }

        .ticker-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.72rem;
            color: rgba(150, 210, 255, 0.5);
            font-weight: 400;
        }

        .ticker-dot {
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: var(--accent3);
        }

        @keyframes ticker {
            0% {
                transform: translateX(0);
            }

            100% {
                transform: translateX(-50%);
            }
        }

        /* Form slide transition */
        .form-panel {
            animation: fadeInUp 0.3s ease both;
        }
        .scrolling-tabs{
            max-height: 480px;
            overflow-y: auto;
        }
        .signup-link {
    margin-top: 18px;
    text-align: center;
    font-size: 0.85rem;
    color: rgba(150, 210, 255, 0.6);
}

.signup-link a {
    color: #00c8ff;
    margin-left: 6px;
    text-decoration: none;
    font-weight: 500;
    position: relative;
    transition: all 0.2s ease;
}

.signup-link a::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 0%;
    height: 1px;
    background: #00c8ff;
    transition: width 0.3s ease;
}

.signup-link a:hover {
    color: #00e5b0;
}

.signup-link a:hover::after {
    width: 100%;
}
    </style>
</head>

<body>

    <!-- Glowing orb -->
    <div class="orb"></div>
    <div class="orb-ring"></div>
    <div class="orb-ring orb-ring2"></div>

    <!-- Floating nodes -->
    <div class="node"
        style="width:8px;height:8px;background:radial-gradient(circle,#00c8ff,transparent);top:22%;left:18%;animation:node-pulse 3.2s ease-in-out infinite;">
    </div>
    <div class="node"
        style="width:6px;height:6px;background:radial-gradient(circle,#00e5b0,transparent);top:35%;left:82%;animation:node-pulse 2.8s ease-in-out infinite 0.5s;">
    </div>
    <div class="node"
        style="width:10px;height:10px;background:radial-gradient(circle,#00a0e0,transparent);top:65%;left:14%;animation:node-pulse 3.8s ease-in-out infinite 1s;">
    </div>
    <div class="node"
        style="width:7px;height:7px;background:radial-gradient(circle,#00e5b0,transparent);top:72%;left:78%;animation:node-pulse 4s ease-in-out infinite 0.3s;">
    </div>
    <div class="node"
        style="width:5px;height:5px;background:radial-gradient(circle,#00c8ff,transparent);top:48%;left:8%;animation:node-pulse 3s ease-in-out infinite 0.8s;">
    </div>
    <div class="node"
        style="width:5px;height:5px;background:radial-gradient(circle,#00c8ff,transparent);top:30%;left:90%;animation:node-pulse 3.5s ease-in-out infinite 1.2s;">
    </div>

    <!-- Side panels -->
    <div class="side-panel side-panel-left">
        <div>Smart City Portal — Bengaluru</div>
        <div class="side-stat">Population: 9,20,000</div>
        <div class="side-stat">Connected Devices: 1.2M</div>
        <div class="side-stat">Uptime: 99.97%</div>
    </div>
    <div class="side-panel side-panel-right">
        <div>Role Based login</div>
        <div class="side-stat">Energy Grid: OPTIMAL</div>
        <div class="side-stat">Traffic Index: LOW</div>
        <div class="side-stat">Air Quality: GOOD</div>
    </div>

    <!-- City Skyline -->
    <svg class="city-skyline" viewBox="0 0 1440 220" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
        <defs>
            <linearGradient id="skyGrad" x1="0" y1="0" x2="0" y2="1">
                <stop offset="0%" stop-color="#00c8ff" stop-opacity="0.18" />
                <stop offset="100%" stop-color="#00c8ff" stop-opacity="0.03" />
            </linearGradient>
            <linearGradient id="buildGrad" x1="0" y1="0" x2="0" y2="1">
                <stop offset="0%" stop-color="#0a2a52" />
                <stop offset="100%" stop-color="#05101e" />
            </linearGradient>
        </defs>
        <!-- Background buildings -->
        <rect x="0" y="120" width="1440" height="100" fill="#030c1e" />
        <!-- Buildings -->
        <rect x="20" y="160" width="28" height="60" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="55" y="140" width="22" height="80" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="85" y="100" width="18" height="120" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.12)"
            stroke-width="0.5" />
        <rect x="90" y="95" width="8" height="8" fill="none" stroke="rgba(0,200,255,0.3)" stroke-width="0.8" />
        <rect x="110" y="130" width="30" height="90" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="148" y="80" width="25" height="140" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="150" y="76" width="5" height="10" fill="#00c8ff" opacity="0.4" />
        <rect x="180" y="150" width="35" height="70" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="222" y="115" width="20" height="105" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.12)"
            stroke-width="0.5" />
        <rect x="250" y="90" width="40" height="130" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="255" y="85" width="8" height="8" fill="none" stroke="rgba(0,200,255,0.3)" stroke-width="0.8" />
        <rect x="300" y="140" width="25" height="80" fill="url(#buildGrad)" />
        <rect x="332" y="100" width="18" height="120" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="357" y="130" width="45" height="90" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <!-- Middle tall building -->
        <rect x="410" y="60" width="30" height="160" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.2)"
            stroke-width="0.5" />
        <rect x="413" y="56" width="6" height="8" fill="#00c8ff" opacity="0.5" />
        <!-- Windows pattern -->
        <g fill="rgba(0,200,255,0.15)">
            <rect x="415" y="70" width="6" height="5" />
            <rect x="426" y="70" width="6" height="5" />
            <rect x="415" y="82" width="6" height="5" />
            <rect x="426" y="82" width="6" height="5" />
            <rect x="415" y="94" width="6" height="5" />
            <rect x="426" y="94" width="6" height="5" />
            <rect x="415" y="106" width="6" height="5" />
            <rect x="426" y="106" width="6" height="5" />
        </g>
        <rect x="448" y="130" width="38" height="90" fill="url(#buildGrad)" />
        <rect x="493" y="110" width="22" height="110" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="522" y="155" width="28" height="65" fill="url(#buildGrad)" />
        <rect x="558" y="105" width="18" height="115" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.12)"
            stroke-width="0.5" />
        <!-- Center landmark -->
        <polygon points="585,40 605,80 625,80" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.3)" stroke-width="0.5" />
        <rect x="590" y="80" width="30" height="140" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.2)"
            stroke-width="0.5" />
        <rect x="596" y="35" width="4" height="12" fill="#00e5b0" opacity="0.6" />
        <g fill="rgba(0,229,176,0.12)">
            <rect x="593" y="90" width="5" height="4" />
            <rect x="602" y="90" width="5" height="4" />
            <rect x="611" y="90" width="5" height="4" />
            <rect x="593" y="100" width="5" height="4" />
            <rect x="602" y="100" width="5" height="4" />
            <rect x="611" y="100" width="5" height="4" />
            <rect x="593" y="110" width="5" height="4" />
            <rect x="602" y="110" width="5" height="4" />
            <rect x="611" y="110" width="5" height="4" />
        </g>
        <rect x="630" y="140" width="32" height="80" fill="url(#buildGrad)" />
        <rect x="670" y="115" width="20" height="105" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="698" y="85" width="28" height="135" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="701" y="80" width="5" height="8" fill="#00c8ff" opacity="0.4" />
        <rect x="735" y="120" width="40" height="100" fill="url(#buildGrad)" />
        <rect x="782" y="100" width="18" height="120" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="808" y="65" width="25" height="155" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.18)"
            stroke-width="0.5" />
        <rect x="812" y="60" width="6" height="8" fill="#00c8ff" opacity="0.5" />
        <g fill="rgba(0,200,255,0.12)">
            <rect x="812" y="75" width="5" height="4" />
            <rect x="821" y="75" width="5" height="4" />
            <rect x="812" y="86" width="5" height="4" />
            <rect x="821" y="86" width="5" height="4" />
            <rect x="812" y="97" width="5" height="4" />
            <rect x="821" y="97" width="5" height="4" />
        </g>
        <rect x="840" y="135" width="35" height="85" fill="url(#buildGrad)" />
        <rect x="882" y="110" width="22" height="110" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="912" y="155" width="30" height="65" fill="url(#buildGrad)" />
        <rect x="950" y="95" width="20" height="125" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.12)"
            stroke-width="0.5" />
        <rect x="978" y="120" width="28" height="100" fill="url(#buildGrad)" />
        <rect x="1014" y="80" width="24" height="140" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="1017" y="75" width="5" height="8" fill="#00e5b0" opacity="0.4" />
        <rect x="1046" y="145" width="40" height="75" fill="url(#buildGrad)" />
        <rect x="1094" y="110" width="18" height="110" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="1120" y="90" width="30" height="130" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="1125" y="85" width="6" height="8" fill="#00c8ff" opacity="0.4" />
        <rect x="1158" y="130" width="22" height="90" fill="url(#buildGrad)" />
        <rect x="1188" y="100" width="18" height="120" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="1214" y="145" width="35" height="75" fill="url(#buildGrad)" />
        <rect x="1257" y="115" width="22" height="105" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.1)"
            stroke-width="0.5" />
        <rect x="1287" y="80" width="28" height="140" fill="url(#buildGrad)" stroke="rgba(0,180,255,0.15)"
            stroke-width="0.5" />
        <rect x="1290" y="75" width="5" height="8" fill="#00c8ff" opacity="0.4" />
        <rect x="1323" y="155" width="30" height="65" fill="url(#buildGrad)" />
        <rect x="1361" y="125" width="25" height="95" fill="url(#buildGrad)" />
        <rect x="1394" y="140" width="46" height="80" fill="url(#buildGrad)" />

        <!-- Glow line along top of buildings -->
        <path
            d="M0,220 L0,160 L20,160 L20,160 L55,140 L85,100 L110,130 L148,80 L180,150 L222,115 L250,90 L300,140 L332,100 L357,130 L410,60 L448,130 L493,110 L522,155 L558,105 L585,40 L625,80 L630,140 L670,115 L698,85 L735,120 L782,100 L808,65 L840,135 L882,110 L912,155 L950,95 L978,120 L1014,80 L1046,145 L1094,110 L1120,90 L1158,130 L1188,100 L1214,145 L1257,115 L1287,80 L1323,155 L1361,125 L1394,140 L1440,140 L1440,220 Z"
            fill="url(#skyGrad)" opacity="0.5" />
    </svg>

    <!-- Page title -->
    <div class="page-title">
        <span class="pre">◈ Smart City Portal</span>
        <h1>Your <span>Connected City</span><br>Awaits You</h1>
    </div>

    <!-- Card -->
    <div class="card-wrapper">
        <div class="card">
            <!-- App icon -->
            <div class="app-icon">
                <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <!-- City building -->
                    <rect x="6" y="18" width="8" height="14" fill="#0e6ea8" rx="1" />
                    <rect x="8" y="20" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="12" y="20" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="8" y="24" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Tall center building -->
                    <rect x="16" y="10" width="10" height="22" fill="#0a5080" rx="1" />
                    <rect x="20" y="7" width="2" height="5" fill="#00e5b0" opacity="0.7" />
                    <rect x="18" y="13" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="22" y="13" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="18" y="18" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <rect x="22" y="18" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Right building -->
                    <rect x="28" y="16" width="7" height="16" fill="#0e6ea8" rx="1" />
                    <rect x="29" y="19" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="33" y="19" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Ground line -->
                    <line x1="4" y1="32" x2="34" y2="32" stroke="#00c8ff" stroke-width="1.2" stroke-opacity="0.5" />
                    <!-- Signal arc -->
                    <path d="M21 4 Q28 4 28 11" stroke="#00e5b0" stroke-width="1.2" fill="none" opacity="0.6"
                        stroke-linecap="round" />
                    <path d="M21 2 Q31 2 31 11" stroke="#00e5b0" stroke-width="0.8" fill="none" opacity="0.35"
                        stroke-linecap="round" />
                </svg>
            </div>

            <p class="card-title">SmartCity Portal</p>
            <p class="card-subtitle">Access city services, dashboards & real-time data</p>

            <!-- Tabs -->
            <div class="tabs">
                <button class="tab active">Sign In</button>
                
            </div>

            <!-- LOGIN PANEL -->
            <div class="scrolling-tabs">
                <div class="form-panel active" id="panel-login">
                <div class="form-group">

                    <form action="login" method="post">
                        <label class="form-label">User name</label>
                        <div class="input-wrap">
                            <span class="input-icon">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <rect x="2" y="4" width="20" height="16" rx="2" />
                                    <path d="m2 7 10 7 10-7" />
                                </svg>
                            </span>
                            <input type="text"  name="username">
                        </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <div class="input-wrap">
                        <span class="input-icon">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" />
                                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                            </svg>
                        </span>
                        <input type="password" id="loginPwd" placeholder="Enter your password" name="password">
                        <span class="input-icon-right" onclick="togglePwd('loginPwd','eyeLogin')">
                            <svg id="eyeLogin" width="15" height="15" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" />
                                <circle cx="12" cy="12" r="3" />
                            </svg>
                        </span>
                    </div>
                </div>
                <div class="checkbox-row">
                    <label class="checkbox-label" onclick="toggleCheck('cb1','cbVis1')">
                        <input type="checkbox" id="cb1">
                        <span class="custom-checkbox" id="cbVis1"></span>
                        Keep me signed in
                    </label>
                    <a class="forgot-link">Forgot password?</a>
                </div>
                <button class="btn-primary" type="submit">Sign In to Portal</button>
                <%String error=(String)request.getAttribute("error"); 
                	if(error!=null){%>
                	<div class="text-danger">
                		<%=error %>
                	</div>
                <%} %>
                </form>

                
            </div>

            
            
            </div>
            <div class="signup-link">
    <span>New user?</span>
    <a href="register.jsp">Create an account</a>
</div>

        </div>
        
    </div>
    
    

    <!-- Trusted bar -->
    <div class="trusted-bar">
        <div class="avatar-stack">
            <div class="avatar">AK</div>
            <div class="avatar">PM</div>
            <div class="avatar">SR</div>
            <div class="avatar">RN</div>
        </div>
        <span class="trusted-text">Trusted by 50,000+ Citizens</span>
    </div>

    <!-- Ticker -->
    <div class="stats-ticker">
        <span class="ticker-label">Live ◈</span>
        <div class="ticker-items">
            <span class="ticker-item"><span class="ticker-dot"></span>Traffic: Mysuru Palace Road — Clear</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Water Supply: Zone 3 — Scheduled 6–8 AM</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Air Quality Index: 48 (Good)</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Smart Bins: 94% capacity managed</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Solar Grid Output: 2.4 MW today</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Emergency Services: All Units Operational</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Bus Route 8: On time — ETA 4 min at Central</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Traffic: Mysuru Palace Road — Clear</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Water Supply: Zone 3 — Scheduled 6–8 AM</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Air Quality Index: 48 (Good)</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Smart Bins: 94% capacity managed</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Solar Grid Output: 2.4 MW today</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Emergency Services: All Units Operational</span>
            <span class="ticker-item"><span class="ticker-dot"></span>Bus Route 8: On time — ETA 4 min at Central</span>
        </div>
    </div>

    <script>
        function switchTab(tab) {
            document.querySelectorAll('.tab').forEach((t, i) => {
                t.classList.toggle('active', (i === 0 && tab === 'login') || (i === 1 && tab === 'register'));
            });
            document.getElementById('panel-login').classList.toggle('active', tab === 'login');
            document.getElementById('panel-register').classList.toggle('active', tab === 'register');
        }

        function togglePwd(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            if (input.type === 'password') {
                input.type = 'text';
                icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
            } else {
                input.type = 'password';
                icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            }
        }

        function toggleCheck(cbId, visId) {
            const cb = document.getElementById(cbId);
            cb.checked = !cb.checked;
            const vis = document.getElementById(visId);
            vis.innerHTML = cb.checked
                ? '<svg width="11" height="11" viewBox="0 0 12 12" fill="none"><path d="M2 6l3 3 5-5" stroke="#00c8ff" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>'
                : '';
            if (cb.checked) {
                vis.style.background = 'rgba(0,150,220,0.2)';
                vis.style.borderColor = 'rgba(0,200,255,0.5)';
            } else {
                vis.style.background = '';
                vis.style.borderColor = '';
            }
        }

        function checkStrength(val) {
            const bars = [document.getElementById('bar1'), document.getElementById('bar2'), document.getElementById('bar3'), document.getElementById('bar4')];
            bars.forEach(b => { b.className = 'pwd-bar'; });
            if (!val) return;
            let score = 0;
            if (val.length >= 8) score++;
            if (/[A-Z]/.test(val)) score++;
            if (/[0-9]/.test(val)) score++;
            if (/[^A-Za-z0-9]/.test(val)) score++;
            const cls = score <= 1 ? 'weak' : score <= 2 ? 'medium' : 'strong';
            for (let i = 0; i < score; i++) bars[i].classList.add(cls);
        }
    </script>
</body>

</html>