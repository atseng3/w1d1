def set_add_el(hsh, input)
  hsh[input.to_sym] = true
  hsh
end

def set_remove_el(hsh, input)
  hsh.delete(input) if hsh.has_key?(input)
  hsh
end

def set_list_els(hsh)
  hsh.keys
end

def set_member?(hsh, input)
  hsh.has_key?(input)
end

def set_union(hsh1, hsh2)
  hsh1.merge(hsh2)
end

def set_intersection(hsh1, hsh2)

  hsh3 = {}

  hsh2.each do |k,v|
    hsh3[k] = v if hsh1.has_key?(k)
  end

  hsh3

end

def set_minus(hsh1, hsh2)

  hsh3 = {}

  hsh1.each do |k,v|
    hsh3[k] = v if !hsh2.has_key?(k)
  end
  hsh3
end

def correct(wrong_hsh)
  correct_hash = {}
  wrong_hsh.each do |key, value|
    correct_hash[value[0].to_sym] = value
  end
  correct_hash
end