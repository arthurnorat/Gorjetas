# Gorjetas

Este projeto é uma aplicação de calculadora de gorjetas desenvolvida em Swift. Ele permite que os usuários calculem o valor da gorjeta com base no total da conta e divida o valor entre várias pessoas.

## Funcionalidades

- Calcular o valor da gorjeta com base em diferentes porcentagens (0%, 10%, 20%).
- Dividir o valor total da conta, incluindo a gorjeta, entre um número especificado de pessoas.
- Exibir o valor por pessoa e a descrição da divisão.

## Classes Principais

### CalculateViewController

Esta classe é responsável por gerenciar a interface onde o usuário insere o valor da conta, seleciona a porcentagem da gorjeta e especifica o número de pessoas entre as quais a conta será dividida.

**Propriedades:**
- `tip`: A porcentagem da gorjeta (padrão é 10%).
- `numberOfPeople`: O número de pessoas para a divisão da conta.
- `billTotal`: O valor total da conta.
- `resultPerPerson`: O resultado do cálculo por pessoa.
- `calculateView`: A view associada a este controlador.
- `valorDaConta`: O valor da conta inserido pelo usuário.

**Métodos:**
- `loadView()`: Configura a view principal.
- `viewDidLoad()`: Configura o delegado da view.
- `tipChanged(sender: UIButton)`: Atualiza a porcentagem da gorjeta com base no botão selecionado.
- `stepperValueChanged(sender: UIStepper)`: Atualiza o número de pessoas com base no valor do stepper.
- `tappedCalculateButton()`: Realiza o cálculo e navega para a tela de resultados.

### ResultViewController

Esta classe é responsável por exibir o resultado do cálculo, mostrando o valor por pessoa e a descrição da divisão da conta.

**Propriedades:**
- `totalPerPerson`: O valor total por pessoa.
- `numberOfPeople`: O número de pessoas para a divisão da conta.
- `tip`: A porcentagem da gorjeta.
- `resultView`: A view associada a este controlador.

**Métodos:**
- `loadView()`: Configura a view principal.
- `viewDidLoad()`: Configura o delegado da view e atualiza a interface com os valores recebidos.
- `tappedRecalculateButton()`: Fecha a tela de resultados e retorna à tela de cálculo.

## Como Usar

1. Insira o valor total da conta.
2. Selecione a porcentagem da gorjeta (0%, 10%, 20%).
3. Use o stepper para especificar o número de pessoas.
4. Toque no botão de calcular para ver o resultado.
5. Na tela de resultados, você verá o valor por pessoa e a descrição da divisão.

## Instalação

Clone este repositório e abra-o no Xcode para rodar o projeto.

```bash
git clone https://github.com/arthurnorat/Gorjetas.git
