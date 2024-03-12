package servlets;

/**
 *
 * @author chump
 */
public class HtmlEscape {
    public static String escapeHtml(String input) {
        if (input == null) {
            return null;
        }

        StringBuilder builder = new StringBuilder();
        for (char c : input.toCharArray()) {
            switch (c) {
                case '&':
                    builder.append("&amp;");
                    break;
                case '<':
                    builder.append("&lt;");
                    break;
                case '>':
                    builder.append("&gt;");
                    break;
                case '"':
                    builder.append("&quot;");
                    break;
                case '\'':
                    builder.append("&#39;");
                    break;
                default:
                    builder.append(c);
            }
        }

        return builder.toString();
    }
}
