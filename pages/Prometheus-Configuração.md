# Configuração

* O Prometheus é configurado por meio de flags de linha de comando e um arquivo de configuração
* Enquanto as flags de linha de comando configuram parâmetros imutáveis ​​do sistema (como locais de armazenamento, quantidade de dados para manter no disco e na memória, etc.)
* O arquivo de configuração define tudo relacionado a jobs de coletas e de suas instâncias, bem como quais arquivos de regras deverão carregar

### Arquivo de configuração

* Para especificar qual arquivo de configuração carregar, use o sinalizador ```--config.file```
* O arquivo é escrito no formato YAML

Os marcadores genéricos são definidos da seguinte forma:

```<boolean>``` : um booleano que pode considerar os valores true ou false
```<duration>``` : uma duração correspondente à expressão regular [0-9]+(ms|[smhdwy])
```<labelname>``` : uma string que corresponde à expressão regular [a-zA-Z_][a-zA-Z0-9_]*
```<labelvalue>``` : uma string de caracteres unicode
```<filename>``` : um caminho válido no diretório de trabalho atual
```<host>``` : uma string válida que consiste em um nome de host ou IP seguido por um número de porta opcional
```<path>``` : um caminho de URL válido
```<scheme>``` : uma string que pode receber os valores http ou https
```<string>``` : uma string regular
```<secret>``` : uma string regular que é um segredo, como uma senha
```<tmpl_string>``` : uma string que é expandida por modelo antes do uso

* Os outros espaços reservados são especificados separadamente
* Um arquivo de exemplo válido pode ser encontrado aqui .
* A configuração global especifica parâmetros válidos em todos os outros contextos de configuração
* Eles também servem como padrões para outras seções de configuração

# Configurando Regras

* O Prometheus suporta dois tipos de regras que podem ser configuradas e, em seguida, avaliadas em intervalos regulares:

* **recording rules e rules alert**. Para incluir regras no Prometheus, crie um arquivo contendo as instruções de regra necessárias e faça com que o Prometheus carregue o arquivo por meio do campo ```rule_files``` na configuração do Prometheus
* Os arquivos de regras podem ser recarregados em tempo de execução enviando SIGHUP para o processo Prometheus
* As alterações serão aplicadas somente se todos os arquivos de regras forem bem formatados


# Regras de Verificação de Sintaxe

* Para verificar rapidamente se um arquivo de regras está correto sem iniciar um servidor Prometheus, execute a tools de utilitário de linha de comando promtool do Prometheus:

```bash
go get github.com/prometheus/prometheus/cmd/promtool promtool check rules /path/to/example.rules.yml
```

* Quando o arquivo é válido, o verificador imprime uma representação textual das regras analisadas na saída padrão e sai com um status de retorno 0
* Se houver algum erro de sintaxe ou argumento de entrada inválido, ele imprime uma mensagem de erro no erro padrão e sai com um status de retorno 1

### Rules Recording

* As recording rules permitem que você pré-calcule expressões frequentemente necessárias ou computacionalmente caras e salve seu resultado como um novo conjunto de time series
* Consultar o resultado pré-computado será então muito mais rápido do que executar a expressão original toda vez que for necessário
* Isso é especialmente útil para painéis, que precisam consultar a mesma expressão repetidamente toda vez que são atualizados

### Alert Recording

* As recording alert permitem definir condições de alerta com base nas expressões de linguagem de expressão do Prometheus e enviar notificações, tais como disparar alertas para um serviço externo
* Sempre que a expressão de alert resultar em um ou mais elementos de vetores em um determinado momento, o alerta conta como ativo para os conjuntos de labels desses elementos

Mais sobre configuração em: https://prometheus.io/docs/prometheus/latest/configuration/configuration/
