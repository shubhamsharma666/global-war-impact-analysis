from openai import OpenAI

client = OpenAI()

response = client.responses.create(
    model="gpt-4.1",
    input="Use the available tools to list all tables in the SQL Server database.",
    tools=[
        {
            "type": "mcp",
            "server_label": "sqlserver",
            "command": "python",
            "args": ["sqlserver_mcp_server.py"]
        }
    ]
)

print(response.output_text)