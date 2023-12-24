output_file="output.txt"

if [ ! -e "$output_file" ]; then
    touch "$output_file"
fi

if [ -n "$1" ]; then
    lines_to_keep="$1"
else
    lines_to_keep=5
fi

top -l 1 -n 0 -F > "$output_file"

if [ $? -eq 0 ]; then
    head -n "$lines_to_keep" "$output_file" > "$output_file.temp"
    mv "$output_file.temp" "$output_file"

    echo "Результат виконання команди top записано у файл $output_file"
else
    echo "Помилка виконання команди top"
fi

