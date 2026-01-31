export async function createRecord(record) {
    const response = await fetch("/records", {
        method: "POST", 
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ record }),
    });

    const data = await response.json();

    if (!response.ok) {
        throw new Error(data.errors?.join("/") || "保存に失敗しました");
    }

    return data;
}