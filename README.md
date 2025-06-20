# 🧠 LexiLearn – Học từ vựng tiếng Anh thông minh (Flutter App – No Backend)

**LexiLearn** là ứng dụng mobile học từ vựng tiếng Anh bằng flashcard kết hợp với ChatGPT để tạo câu hỏi luyện tập. Mọi dữ liệu được lưu trữ **trực tiếp trên thiết bị**, không cần backend – dễ dùng, nhanh chóng và bảo mật.

---

## ✨ Tính năng chính

- 📚 **Flashcard từ vựng**: Tạo và học từ vựng theo chủ đề hoặc tự chọn.
- 🤖 **Tạo câu hỏi bằng ChatGPT**: Sinh câu trắc nghiệm, điền từ, đặt câu... từ chính từ vựng bạn đang học.
- ⏳ **Hệ thống ôn tập Spaced Repetition (SRS)**: Gợi ý thời điểm học lại giúp bạn nhớ lâu hơn.
- 📈 **Theo dõi tiến độ học tập**: Biết được từ nào đã học, còn yếu, cần ôn lại.


| Thành phần | Công nghệ |
|------------|-----------|
| UI         | Flutter (Material 3) |
| Trạng thái | Riverpod |
| API GPT    | `http` (gọi OpenAI trực tiếp từ client) |

| CI/CD      | GitHub Actions + Codemagic |

---

## 🧠 Cách hoạt động

1. Người dùng thêm từ mới (hoặc chọn từ danh sách có sẵn).
2. App tạo flashcard chứa: từ, nghĩa, ví dụ.
3. App gọi OpenAI API để sinh câu hỏi luyện tập dựa trên từ đó.
4. Dữ liệu được lưu lại bằng Hive (bao gồm trạng thái nhớ/quên, lịch ôn tập).
5. Hằng ngày, app gợi ý từ cần ôn dựa trên thuật toán SRS.

---

## 📦 Cài đặt (dành cho Developer)

```bash
git clone https://github.com/yourusername/lexilearn.git
cd lexilearn
flutter pub get
flutter run
