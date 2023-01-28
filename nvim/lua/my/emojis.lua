local emojis = {
  "💯",
  "😀",
  "😬",
  "😁",
  "😂",
  "🤣",
  "😃",
  "😄",
  "😅",
  "😆",
  "😇",
  "😉",
  "😊",
  "🙂",
  "🙃",
  "☺️ ",
  "😋",
  "😌",
  "😍",
  "😘",
  "😗",
  "😙",
  "😚",
  "😜",
  "😝",
  "😛",
  "🤑",
  "🤓",
  "😎",
  "🤡",
  "🤠",
  "🤗",
  "😏",
  "😶",
  "😐",
  "😑",
  "😒",
  "🙄",
  "🤔",
  "🤥",
  "😳",
  "😞",
  "😟",
  "😠",
  "😡",
  "😔",
  "😕",
  "🙁",
  "😣",
  "😖",
  "😫",
  "😩",
  "😤",
  "😮",
  "😱",
  "😨",
  "😰",
  "😦",
  "😧",
  "😢",
  "😥",
  "🤤",
  "😓",
  "😭",
  "😵",
  "😲",
  "🤐",
  "🤢",
  "🤧",
  "😷",
  "🤒",
  "🤕",
  "😴",
  "💤",
  "💩",
  "😈",
  "👹",
  "👺",
  "💀",
  "👻",
  "👽",
  "🤖",
  "😺",
  "😸",
  "😹",
  "😻",
  "🙀",
  "😿",
  "😾",
  "🙌",
  "👏",
  "👋",
  "🤙",
  "👍",
  "👎",
  "👊",
  "🤜",
  "✌ ",
  "👌",
  "✋",
  "🤚",
  "👐",
  "💪",
  "🙏",
  "🤝",
  "☝ ",
  "👆",
  "👇",
  "👈",
  "👉",
  "🖕",
  "🖐 ",
  "🤘",
  "🤞",
  "🖖",
  "✍ ",
  "🤳",
  "💅",
  "👂",
  "👀",
  "👤",
  "👥",
  "🗣 ",
  "👶",
  "👧",
  "👨",
  "👩",
  "👱",
  "👴",
  "👵",
  "👲",
  "👚",
  "👕",
  "👖",
  "👔",
  "👗",
  "👙",
  "👘",
  "💄",
  "💋",
  "👣",
  "👠",
  "👡",
  "👟",
  "👒",
  "🎩",
  "⛑ ",
  "🎓",
  "👑",
  "🎒",
  "👝",
  "👛",
  "👜",
  "💼",
  "👓",
  "🕶 ",
  "💍",
  "🌂",
  "🐶",
  "🐱",
  "🐭",
  "🐹",
  "🐰",
  "🦊",
  "🐻",
  "🐼",
  "🐨",
  "🐯",
  "🦁",
  "🐮",
  "🐷",
  "🐽",
  "🐸",
  "🦑",
  "🐙",
  "🦐",
  "🐵",
  "🦍",
  "🙈",
  "🙉",
  "🙊",
  "🐒",
  "🐔",
  "🐧",
  "🐦",
  "🐤",
  "🐣",
  "🐥",
  "🦆",
  "🦅",
  "🦉",
  "🦇",
  "🐺",
  "🐗",
  "🐴",
  "🦄",
  "🐝",
  "🐛",
  "🦋",
  "🐌",
  "🐞",
  "🐜",
  "🕷 ",
  "🦂",
  "🦀",
  "🐍",
  "🦎",
  "🐢",
  "🐠",
  "🐟",
  "🐡",
  "🐬",
  "🦈",
  "🐳",
  "🐋",
  "🐊",
  "🐆",
  "🐅",
  "🐃",
  "🐂",
  "🐄",
  "🦌",
  "🐪",
  "🐫",
  "🐘",
  "🦏",
  "🐐",
  "🐏",
  "🐑",
  "🐎",
  "🐖",
  "🐀",
  "🐁",
  "🐓",
  "🦃",
  "🕊 ",
  "🐕",
  "🐩",
  "🐈",
  "🐇",
  "🐿 ",
  "🐾",
  "🐉",
  "🐲",
  "🌵",
  "🎄",
  "🌲",
  "🌳",
  "🌴",
  "🌱",
  "🌿",
  "☘ ",
  "🍀",
  "🎍",
  "🎋",
  "🍃",
  "🍂",
  "🍁",
  "🌾",
  "🌺",
  "🌻",
  "🌹",
  "🥀",
  "🌷",
  "🌼",
  "🌸",
  "💐",
  "🍄",
  "🌰",
  "🎃",
  "🐚",
  "🕸 ",
  "🌎",
  "🌍",
  "🌏",
  "🌕",
  "🌖",
  "🌗",
  "🌘",
  "🌑",
  "🌒",
  "🌓",
  "🌔",
  "🌚",
  "🌝",
  "🌛",
  "🌜",
  "🌞",
  "🌙",
  "⭐",
  "🌟",
  "💫",
  "✨",
  "☄ ",
  "☀️ ",
  "🌤 ",
  "⛅",
  "🌥 ",
  "🌦 ",
  "☁️ ",
  "🌧 ",
  "⛈ ",
  "🌩 ",
  "⚡",
  "🔥",
  "💥",
  "❄️ ",
  "🌨 ",
  "⛄",
  "☃ ",
  "🌬 ",
  "💨",
  "🌪 ",
  "🌫 ",
  "☂ ",
  "☔",
  "💧",
  "💦",
  "🌊",
  "🍏",
  "🍎",
  "🍐",
  "🍊",
  "🍋",
  "🍌",
  "🍉",
  "🍇",
  "🍓",
  "🍈",
  "🍒",
  "🍑",
  "🍍",
  "🥝",
  "🍅",
  "🍆",
  "🥒",
  "🥕",
  "🌶 ",
  "🥔",
  "🌽",
  "🍠",
  "🥜",
  "🍯",
  "🥐",
  "🍞",
  "🥖",
  "🧀",
  "🥚",
  "🥓",
  "🥞",
  "🍗",
  "🍖",
  "🍤",
  "🍳",
  "🍔",
  "🍟",
  "🥙",
  "🌭",
  "🍕",
  "🍝",
  "🥗",
  "🥘",
  "🍜",
  "🍲",
  "🍥",
  "🍣",
  "🍱",
  "🍛",
  "🍙",
  "🍚",
  "🍘",
  "🍢",
  "🍡",
  "🍧",
  "🍨",
  "🍦",
  "🍰",
  "🎂",
  "🍮",
  "🍬",
  "🍭",
  "🍫",
  "🍿",
  "🍩",
  "🍪",
  "🥛",
  "🍺",
  "🍻",
  "🥂",
  "🍷",
  "🥃",
  "🍸",
  "🍹",
  "🍾",
  "🍶",
  "🍵",
  "☕",
  "🍼",
  "🥄",
  "🍴",
  "🍽 ",
  "🏈",
  "🏉",
  "🎱",
  "⛳",
  "🏌 ",
  "🏸",
  "🏏",
  "🎣",
  "🥊",
  "🥋",
  "🏇",
  "🕴 ",
  "🏆",
  "🎽",
  "🏅",
  "🎖 ",
  "🥇",
  "🥈",
  "🥉",
  "🎗 ",
  "🏵 ",
  "🎫",
  "🎟 ",
  "🎭",
  "🎨",
  "🎪",
  "🎤",
  "🎧",
  "🎼",
  "🎹",
  "🥁",
  "🎷",
  "🎺",
  "🎻",
  "🎬",
  "🎮",
  "👾",
  "🎯",
  "🎲",
  "🎰",
  "🎳",
  "🚗",
  "🚕",
  "🚙",
  "🚌",
  "🚎",
  "🏎 ",
  "🚓",
  "🚑",
  "🚒",
  "🚐",
  "🚚",
  "🚛",
  "🚜",
  "🛴",
  "🏍 ",
  "🚲",
  "🛵",
  "🚨",
  "🚔",
  "🚍",
  "🚘",
  "🚖",
  "🚡",
  "🚠",
  "🚟",
  "🚃",
  "🚋",
  "🚝",
  "🚄",
  "🚅",
  "🚈",
  "🚞",
  "🚂",
  "🚆",
  "🚇",
  "🚊",
  "🚉",
  "🚁",
  "🛩 ",
  "✈️ ",
  "🛫",
  "🛬",
  "⛵",
  "🛥 ",
  "🚤",
  "⛴ ",
  "🛳 ",
  "🚀",
  "🛰 ",
  "💺",
  "🛶",
  "⚓",
  "🚧",
  "⛽",
  "🚏",
  "🚦",
  "🚥",
  "🏁",
  "🚢",
  "🎡",
  "🎢",
  "🎠",
  "🏗 ",
  "🌁",
  "🗼",
  "🏭",
  "⛲",
  "🎑",
  "⛰ ",
  "🏔 ",
  "🗻",
  "🌋",
  "🗾",
  "🏕 ",
  "⛺",
  "🏞 ",
  "🛣 ",
  "🛤 ",
  "🌅",
  "🌄",
  "🏜 ",
  "🏖 ",
  "🏝 ",
  "🌇",
  "🌆",
  "🏙 ",
  "🌃",
  "🌉",
  "🌌",
  "🌠",
  "🎇",
  "🎆",
  "🌈",
  "🏘 ",
  "🏰",
  "🏯",
  "🏟 ",
  "🗽",
  "🏠",
  "🏡",
  "🏚 ",
  "🏢",
  "🏬",
  "🏣",
  "🏤",
  "🏥",
  "🏦",
  "🏨",
  "🏪",
  "🏫",
  "🏩",
  "💒",
  "🏛 ",
  "⛪",
  "🕌",
  "🕍",
  "🕋",
  "⛩ ",
  "⌚",
  "📱",
  "📲",
  "💻",
  "🖥 ",
  "🖲 ",
  "🕹 ",
  "💽",
  "💾",
  "💿",
  "📀",
  "📼",
  "📷",
  "📸",
  "📹",
  "📽 ",
  "🎞 ",
  "📞",
  "☎️ ",
  "📟",
  "📺",
  "📻",
  "🎙 ",
  "⏱ ",
  "⏳",
  "⌛",
  "📡",
  "💡",
  "🔦",
  "🕯 ",
  "🗑 ",
  "🛢 ",
  "💸",
  "💵",
  "💴",
  "💶",
  "💷",
  "💰",
  "💳",
  "💎",
  "⚖ ",
  "🔧",
  "🔨",
  "🛠 ",
  "⚙ ",
  "🔫",
  "💣",
  "🔪",
  "🛡 ",
  "🚬",
  "🏺",
  "🔮",
  "📿",
  "🔭",
  "🔬",
  "🕳 ",
  "💊",
  "💉",
  "🌡 ",
  "🚽",
  "🛁",
  "⛱ ",
  "🗿",
  "🎈",
  "🎏",
  "🎀",
  "🎁",
  "🎊",
  "🎉",
  "🎐",
  "🎌",
  "🏮",
  "✉️ ",
  "📩",
  "📨",
  "💌",
  "📮",
  "📪",
  "📫",
  "📬",
  "📭",
  "📦",
  "📜",
  "📃",
  "📑",
  "📊",
  "📈",
  "📉",
  "📄",
  "📆",
  "🗓 ",
  "📇",
  "🗃 ",
  "🗄 ",
  "📋",
  "🗒 ",
  "📁",
  "📂",
  "🗂 ",
  "🗞 ",
  "📓",
  "📕",
  "📗",
  "📘",
  "📙",
  "📔",
  "📚",
  "📖",
  "📎",
  "🖇 ",
  "✂️ ",
  "📐",
  "📏",
  "📌",
  "📍",
  "🚩",
  "🏳 ",
  "🌈",
  "🔐",
  "🔒",
  "🔏",
  "✒️ ",
  "📝",
  "✏️ ",
  "🖌 ",
  "🔍",
  "🔎",
  "🔈",
  "🔉",
  "🔊",
  "🔇",
  "🔔",
  "🔕",
  "🃏",
  "🀄",
  "♠️ ",
  "♣️ ",
  "♥️ ",
  "♦️ ",
  "🎴",
}


function random_emoji()
  math.randomseed(math.random())
  return emojis[math.random(#emojis)]
end
