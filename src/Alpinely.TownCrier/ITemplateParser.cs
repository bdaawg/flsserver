using System.Collections.Generic;

namespace Alpinely.TownCrier
{
    public interface ITemplateParser
    {
        /// <summary>
        /// Replaces tokens in the template text with the values from the supplied dictionary
        /// </summary>
        /// <param name="templateText">The template text</param>
        /// <param name="tokenValues">Dictionary mapping token names to values</param>
        /// <returns>Text with tokens replaced with their corresponding values from the dictionary</returns>
        string ReplaceTokens(string templateText, IDictionary<string, object> tokenValues);
    }
}