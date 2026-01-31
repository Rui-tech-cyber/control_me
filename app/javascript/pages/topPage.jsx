import { useState } from "react";
import topRecordForm from "../components/topRecordForm";
import { createRecord } from "../api/records";

//top画面（controlMeのメインページ）
export default function topPage() {
    const [message, setMessage] = useState(null);
    const [error, setError] = useState(null);

    const categories = [
        { key: "study", label: "学習時間", unit: "時間" },
        { key: "weight", label: "体重", unit: "kg" },
        { key: "training", label: "トレーニング", unit: "回" },
    ];

    const handleSubmit = async (recordData) => {
        setMessage(null);
        setError(null);

        try{
            await createRecord(recordData);
            setMessage("記録しました！");
        } catch (err) {
            setError(err.message);
        }
    };

    return (
        <div className="min-h-screen bg-gray-100 p-6">
            <h1 className="text-2xl font-bold text-center mb-6">controlMe</h1>

            <topRecordForm categories={categories} onSubmit={handleSubmit} />

            {message && (
                <p className="mt-4 text-center text-green-600">{message}</p>
            )}

            {error && (
                <p className="mt-4 text-center text-red-600">{error}</p>
            )}
        </div>
    );
}
