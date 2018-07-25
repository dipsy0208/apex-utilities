/*
In Java (and presumably apex) String is an immutable object, meaning that whenever you wish to append to a string you are creating a new instance of the object,
string builder mitigates this by only generating the string when it is needed. This class can be useful when joining a large number of strings together
*/
public virtual class StringBuilder {

    @testVisible private final List<String> buffer = new List<String>();
    @testVisible private String separator = '';

    public StringBuilder append(String value) {
        if (value != null) {
            buffer.add(value);
        }
        return this;
    }

    public StringBuilder append(Object value) {
        String stringValue = String.valueOf(value);
        return append(stringValue);
    }

    public void setSeparator(String separator) {
        if (String.isNotEmpty(separator)) {
            this.separator = separator;
        }
    }

    public Integer length() {
        return buffer.size();
    }

    public override String toString() {
        return String.join(buffer, separator);
    }
}