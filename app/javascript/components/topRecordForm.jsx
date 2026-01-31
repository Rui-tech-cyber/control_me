import { useState } from "react";

//top画面のメイン入力フォーム
//カテゴリに応じて入力項目・単位が変わる
export default function topRecordForm({ categories, onSubmit }) {
    const [category, setCategory] = useState("");
    const [value, setValue] = useState("");
    const [date, setDate] = useState(() => {
        const today = new Date();
        return today.toISOString().slice(0, 10); // YYYY-MM-DD
    });

    const selectedCategory = categories.find((c) => c.key === category);

    const handleSubmit = (e) => {
        e.preventDefault();

        if (!category || value === "") return;

        onSubmit({ category, value: Number(value), recorded_at: date });

        setValue("");
    };

    return (
        <form onSubmit={handleSubmit} className="max-w-xl mx-auto bg-white rounded-2xl shadow p-6 space-y-4">
            <h2 className="text-xl font-semibold">今日の記録</h2>

            {/* カテゴリ選択 */}
            <div>
                <label className="block text-sm font-medium mb-1">カテゴリ</label>
                <select value="{category}" onChange="{(e) => setCategory(e.target.value)}" className="w-full border rounded-lg p-2">
                    <option value="">選択してください</option>
                    {categories.map((c) => (
                        <option key={c.key} value={c.key}>{c.label}</option>
                    ))}
                </select>
            </div>

            {/* 日付 */}
            <div>
                <label className="block text-sm font-medium mb-1">日付</label>
                <input type="date" value="{date}" onChange={(e) => setDate(e.target.value)} className="w-full border rounded-lg p-2" />
            </div>

            {/* 数値入力 */}
            {selectedCategory && (
                <div>
                    <label className="block text-sm font-medium mb-1">{selectedCategory.label}</label>
                    <div className="flex items-center gap-2">
                        <input type="number" value={value} onChange={(e) => setValue(e.target.value)} className="flex-1 border rounded-lg p-2" />
                        <span className="text-gray-600">{selectedCategory.unit}</span>
                    </div>
                </div>
            )}

            <button type="submit" disabled={!selectedCategory} className="w-full bg-blue-600 text-white py-2 rounded-lg disabled:opacity-50">
                記録する
            </button>
        </form>
    );
}
