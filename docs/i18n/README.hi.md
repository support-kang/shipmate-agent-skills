# Shipmate

<p align="center"><img src="../../assets/shipmate-logo.png" alt="Shipmate लोगो" width="280"></p>
<p align="center"><strong>सावधानी से योजना बनाएँ। टेस्ट-फर्स्ट विकसित करें। आत्मविश्वास से शिप करें।</strong></p>

[한국어 / English](../../README.md)

Shipmate एक मल्टी-एजेंट वर्कफ़्लो स्किल है जो योजना, TDD, दस्तावेज़ीकरण, स्वतंत्र प्रतिकूल समीक्षा और PR निगरानी को एक प्रक्रिया में जोड़ती है, ताकि AI-आधारित विकास अधिक कुशल और भरोसेमंद बने। यह Cursor, Claude Code और Codex के साथ काम करती है।

## स्किल्स

- `shipmate-setup`: प्रत्येक प्रोजेक्ट में एक बार चलाकर रूट `AGENTS.md`, टिकाऊ दस्तावेज़ संरचना और खोजे गए TDD निर्देश सेट करता है।
- `shipmate`: स्वीकृत योजना से RED → GREEN → REFACTOR, छोटे परमाणु कमिट, दस्तावेज़ीकरण, स्वतंत्र प्रतिकूल समीक्षा, अंत में PR निर्माण और मर्ज-रेडी होने तक निगरानी करता है।

```text
SETUP → PLAN → PLAN GATE → RED → GREEN → REFACTOR → DOCUMENT
      → ADVERSARIAL REVIEW → LOCAL GATE → PR → BABYSIT → MERGE-READY
```

PR बनाना स्थानीय विकास का अंतिम चरण है। स्पष्ट अनुरोध के बिना Shipmate कभी मर्ज नहीं करता।

## इंस्टॉलेशन

macOS/Linux: `./scripts/install.sh codex`  
Windows: `.\scripts\install.ps1 -Platform codex`

ज़रूरत के अनुसार `codex` को `cursor` या `claude-code` से बदलें। नया एजेंट सत्र शुरू करें, पहले `shipmate-setup` चलाएँ और बाद के काम के लिए `shipmate` उपयोग करें।

सेटअप मौजूदा फ़ाइलों को सुरक्षित रखता है और केवल गायब संरचना तथा स्पष्ट सीमा वाला प्रबंधित ब्लॉक जोड़ता है। Shipmate [MIT लाइसेंस](../../LICENSE) के अंतर्गत है; तृतीय-पक्ष श्रेय के लिए [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md) देखें।
