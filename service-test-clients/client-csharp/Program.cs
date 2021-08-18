using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace client_csharp
{
    static class Program
    {
        static async Task Main(string[] args)
        {
            if (args.Length > 1)
                throw new ArgumentOutOfRangeException(nameof(args), "You can provide only one argument.");

            var input = args.Length == 0 ? string.Empty : args[0];

            var queryInput = JsonSerializer.Serialize(input);
            var data = new StringContent(queryInput, Encoding.UTF8, "application/json");

            using var client = new HttpClient();
            
            var response = await client.PostAsync("http://127.0.0.1:5000/lemma", data);
            var result = response.Content.ReadAsStringAsync().Result;

            var lemmas = JsonSerializer.Deserialize<List<string>>(result);
            
            Console.WriteLine($"Lemmas: {string.Join(", ", lemmas)}");
        }
    }
}
