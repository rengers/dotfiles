function copy_and_extend(original, new_values)
    local result = {}
    for k, v in pairs(original) do
        result[k] = v
    end
    for k, v in pairs(new_values) do
        result[k] = v
    end
    return result
end
