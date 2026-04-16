<div align="center">

# Claude Code Practices

</div>

---

Claude Code'u kullanmaya başladığımda ilk hafta şunu yazdım: *"Bu projeyi iyileştir."*

Claude 4 dosya okudu, 2 dosya değiştirdi, 1 dosyayı yanlışlıkla bozdu. 34,000 token harcadı. Hiçbir şey düzelmedi.

Sonra `/cost` yazdım. $0.09 harcamıştım. Hiçbir iş için.

---

Geçen 1 ay boyunca neyin işe yarayıp neyin yaramadığını öğrenmek için çok zaman harcadım. Bu repo o deneyimin özeti.

**Sonuç:** Aynı işi ortalama **%60-70 daha az token** ile yapıyorum.

---

## En Önemli 3 Şey

Burayı oku, gerisini sonra bak.

### 1. Promptun ne kadar spesifik olduğu her şeyi değiştirir

```
# Bu 34,000 token harcar
"Bu projeyi iyileştir"

# Bu 4,000 token harcar
"src/auth/login.ts:87 — validateEmail() fonksiyonuna RFC 5322 kontrolü ekle"
```

Fark: **8.5x**. Aynı sonuç, sekizde bir maliyet.

### 2. `/compact` doğru kullanılmadığında işe yaramaz

```bash
# Neredeyse hiçbir şey kesmez
/compact

# Bağlamın %70'ini keser, iş kalitesini düşürmez
/compact Keep only changed functions and relevant test output
```

Uzun bir oturumda bunu iki kez kullandım. Token sayısı 82,000'den 11,000'e düştü.

### 3. `.claudeignore` dosyası olmadan Claude gereksiz yerlere bakıyor

```gitignore
node_modules/
dist/
*.log
coverage/
*.lock
```

Bu 6 satır, projeye bağlı olarak Claude'un okuduğu dosya sayısını **3-10x azaltıyor**.

---

## Bu Repo Ne İçeriyor

### [Skill Kütüphanesi](skills/README.md) — 82 skill

`.claude/skills/` klasörüne kopyala, `/komut-adı` ile kullan.

```bash
cp -r skills/ .claude/skills/
```

| Kategori | Skill Sayısı | Örnekler |
|---|---|---|
| Git & GitHub | 13 | `/fix-issue`, `/pr-review`, `/commit`, `/release-notes` |
| Test | 7 | `/test-generate`, `/test-coverage`, `/test-e2e` |
| Frontend | 9 | `/component-gen`, `/seo-check`, `/state-audit` |
| Backend | 10 | `/api-endpoint`, `/auth-middleware`, `/rate-limiter` |
| Mobile | 4 | `/react-native-component`, `/mobile-perf`, `/expo-setup` |
| Güvenlik | 3 | `/security-audit`, `/secret-scan`, `/dependency-audit` |
| Veritabanı | 6 | `/migration-gen`, `/query-optimize`, `/schema-review` |
| + daha fazlası | ... | [Tümünü gör →](skills/README.md) |

### [Türkçe Rehber](tr/README.md) · [English Guide](en/README.md)

Kısayollar, slash komutları, hook tarifleri, CLAUDE.md yapısı, izin modları — hepsi tek dosyada.

### [Cheatsheet](CHEATSHEET.md)

Bookmarklık tek sayfalık hızlı referans.

---

## Okuyana Göre

**Yeni başlıyorsan** → [Cheatsheet](CHEATSHEET.md)'e bak, ilk skill'i kopyala, dene.

**Token maliyetin yüksekse** → [Token optimizasyon bölümü](tr/README.md#3-token-optimizasyonu)

**Aynı promptları tekrar yazıyorsan** → [Skills](skills/README.md)

**Ekibinle paylaşmak istiyorsan** → `CLAUDE.md` şablonu [burada](tr/README.md#4-claudemd)

---

## Katkı

Daha iyi bir yöntem bulduysan, yeni bir skill yazdıysan, bir hata gördüysen — PR aç.

→ [CONTRIBUTING.md](CONTRIBUTING.md)

---

<div align="center">
<sub>Faydalı olduysa ⭐ — başkasının bulmasına yardım eder.</sub>
</div>
