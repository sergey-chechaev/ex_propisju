defmodule ExPropisju do
  @moduledoc """
  Documentation for ExPropisju.
  ## Examples

      iex> ExPropisju.rublej(123)
      "сто двадцать три рубля"
      iex> ExPropisju.propisju_shtuk(100, 1, ["процент", "процентов", "процентов"])
      "сто процентов"
  """

  @translations %{
    "ru" => %{
      0 => "",
      '0' => "ноль",
      :thousands => ["тысяча", "тысячи", "тысяч"],
      :millions => ["миллион", "миллиона", "миллионов"],
      :billions => ["миллиард", "миллиарда", "миллиардов"],
      100 => "сто",
      200 => "двести",
      300 => "триста",
      400 => "четыреста",
      500 => "пятьсот",
      600 => "шестьсот",
      700 => "семьсот",
      800 => "восемьсот",
      900 => "девятьсот",

      10 => "десять",
      11 => "одиннадцать",
      12 => "двенадцать",
      13 => "тринадцать",
      14 => "четырнадцать",
      15 => "пятнадцать",
      16 => "шестнадцать",
      17 => "семнадцать",
      18 => "восемнадцать",
      19 => "девятнадцать",
      20 => "двадцать",
      30 => "тридцать",
      40 => "сорок",
      50 => "пятьдесят",
      60 => "шестьдесят",
      70 => "семьдесят",
      80 => "восемьдесят",
      90 => "девяносто",
      # единицы, местами - c учетом рода
      1 => %{1 => "один", 2 => 'одна', 3 => 'одно'},
      2 => %{1 => "два", 2 => 'две', 3 => 'два'},
      3 => "три",
      4 => "четыре",
      5 => "пять",
      6 => "шесть",
      7 => "семь",
      8 => "восемь",
      9 => "девять",
      :rub_integral => ["рубль", "рубля", "рублей"],
      :rub_fraction => ['копейка', 'копейки', 'копеек'],
      :uah_integral => ["гривна", "гривны", "гривен"],
      :uah_fraction => ['копейка', 'копейки', 'копеек'],
      :kzt_integral => ["тенге", "тенге", "тенге"],
      :kzt_fraction => ['тиын', 'тиына', 'тиынов'],
      :eur_integral => ["евро", "евро", "евро"],
      # по опыту моей прошлой работы в банке
      # центами называют дробную часть доллара
      # а дробную часть евро называют евроцентом
      :eur_fraction => ["цент", "цента", "центов"],
      :usd_integral => ["доллар", "доллара", "долларов"],
      :usd_fraction => ['цент', 'цента', 'центов'],
    },
    "ru_in" => %{ # Предложный падеж, например в 2 городах
      0 => "",
      "0" => "нуле",
      :thousands => ["тысяче", "тысячах", "тысячах"],
      :millions => ["миллионе", "миллионах", "миллионах"],
      :billions => ["миллиарде", "миллиардах", "миллиардах"],
      100 => "ста",
      200 => "двухстах",
      300 => "трёхстах",
      400 => "четырёхстах",
      500 => "пятистах",
      600 => "шестистах",
      700 => "семистах",
      800 => "восьмистах",
      900 => "девятистах",

      10 => "десяти",
      11 => "одиннадцати",
      12 => "двенадцати",
      13 => "тринадцати",
      14 => "четырнадцати",
      15 => "пятнадцати",
      16 => "шестнадцати",
      17 => "семнадцати",
      18 => "восемнадцати",
      19 => "девятнадцати",
      20 => "двадцати",
      30 => "тридцати",
      40 => "сорока",
      50 => "пятидесяти",
      60 => "шестидесяти",
      70 => "семидесяти",
      80 => "восьмидесяти",
      90 => "девяноста",
      # единицы, местами - c учетом рода
      1 => %{ 1 => "одном", 2 => "одной", 3 => "одном" },
      2 => %{ 1 => "двух", 2 => "двух", 3 => "двух" },
      3 => "трёх",
      4 => "четырёх",
      5 => "пяти",
      6 => "шести",
      7 => "семи",
      8 => "восьми",
      9 => "девяти",
      :rub_integral => ~w[рубле рублях рублях],
      :rub_fraction => ~w[копейке копейках копейках],
      :uah_integral => ~w[гривне гривнах гривнах],
      :uah_fraction => ~w[копейке копейках копейках],
      :kzt_integral => ~w[тенге тенге тенге],
      :kzt_fraction => ~w[тиыне тиынах тиынах],
      :eur_integral => ~w[евро евро евро],
      # по опыту моей прошлой работы в банке
      # центами называют дробную часть доллара
      # а дробную часть евро называют евроцентом
      :eur_fraction => ~w[центе центах центах],
      :usd_integral => ~w[долларе долларах долларах],
      :usd_fraction => ~w[центе центах центах],
    },
    "ru_gen" => %{ # Родительный падеж, например в течение одного рабочего дня, пяти ночей (нуля рабочих дней)
       0 => '',
       '0' => 'нуля',
       :thousands => ~w[тысячи тысяч тысяч],
       :millions => ~w[миллиона миллионов миллионов],
       :billions => ~w[миллиарда миллиардов миллиардов],
       100 => 'ста',
       200 => 'двухсот',
       300 => 'трёхсот',
       400 => 'четырёхсот',
       500 => 'пятисот',
       600 => 'шестисот',
       700 => 'семисот',
       800 => 'восьмисот',
       900 => 'девятисот',

       10 => 'десяти',
       11 => 'одиннадцати',
       12 => 'двенадцати',
       13 => 'тринадцати',
       14 => 'четырнадцати',
       15 => 'пятнадцати',
       16 => 'шестнадцати',
       17 => 'семнадцати',
       18 => 'восемнадцати',
       19 => 'девятнадцати',
       20 => 'двадцати',
       30 => 'тридцати',
       40 => 'сорока',
       50 => 'пятидесяти',
       60 => 'шестидесяти',
       70 => 'семидесяти',
       80 => 'восьмидесяти',
       90 => 'девяноста',
       # единицы, местами - c учетом рода
       1 => %{ 1 => "одного", 2 => "одной", 3 => "одного" },
       2 => %{ 1 => "двух", 2 => "двух", 3 => "двух" },
       3 => "трёх",
       4 => "четырёх",
       5 => "пяти",
       6 => "шести",
       7 => "семи",
       8 => "восьми",
       9 => "девяти",
       :rub_integral => ~w[рубля рублей рублей],
       :rub_fraction => ~w[копейки копеек копеек],
       :uah_integral => ~w[гривны гривен гривен],
       :uah_fraction => ~w[копейки копеек копеек],
       :kzt_integral => ~w[тенге тенге тенге],
       :kzt_fraction => ~w[тиына тиынов тиынов],
       :eur_integral => ~w[евро евро евро],
       # TODO: решить как же всё-таки звать дробную часть евро: "цент" или "евроцент"
       :eur_fraction => ~w[цента центов центов],
       :usd_integral => ~w[доллара долларов долларов],
       :usd_fraction => ~w[цента центов центов],
    },
    "ru_from" => %{
      0 => "",
      "0" => "нулём",
      :thousands => ["тысячю", "тысячами", "тысячами"],
      :millions => ["миллионом", "миллионами", "миллионами"],
      :billions => ["миллиардом", "миллиардами", "миллиардами"],
      100 => "ста",
      200 => "двумястами",
      300 => "тремястами",
      400 => "четырьмястами",
      500 => "пятьюстами",
      600 => "шестьюстами",
      700 => "семьюстами",
      800 => "восьмьюстами",
      900 => "девятьюстами",

      10 => "десятью",
      11 => "одиннадцатью",
      12 => "двенадцатью",
      13 => "тринадцатью",
      14 => "четырнадцатью",
      15 => "пятнадцатью",
      16 => "шестнадцатью",
      17 => "семнадцатью",
      18 => "восемнадцатью",
      19 => "девятнадцатью",
      20 => "двадцатью",
      30 => "тридцатью",
      40 => "сорока",
      50 => "пятьюдесятью",
      60 => "шестьюдесятью",
      70 => "семьюдесятью",
      80 => "восьмьюдесятью",
      90 => "девяноста",
      # единицы, местами - c учетом рода
      1 => %{1 => "одним", 2 => "одной", 3 => "одним"},
      2 => %{1 => "двумя", 2 => "двумя", 3 => "двумя"},
      3 => "тремя",
      4 => "четырьмя",
      5 => "пятью",
      6 => "шестью",
      7 => "семью",
      8 => "восьмью",
      9 => "девятью",
      :rub_integral => ["рублём", "рублями", "рублями"],
      :rub_fraction => ['копейкой', "копейками", "копейками"],
      :uah_integral => ["гривной", "гривнами", "гривнами"],
      :uah_fraction => ["копейкой", "копейками", "копейками"],
      :kzt_integral => ["тенге", "тенге", "тенге"],
      :kzt_fraction => ["тиыной", "тиынами", "тиынами"],
      :eur_integral => ["евро", "евро", "евро"],
      # по опыту моей прошлой работы в банке
      # центами называют дробную часть доллара
      # а дробную часть евро называют евроцентом
      :eur_fraction => ["центом", "центами", "центами"],
      :usd_integral => ["долларом", "долларами", "долларами"],
      :usd_fraction => ["центом", "центами", "центами"],
    },
    "ua" => %{
      0 => "",
      '0' => "нуль",
      :thousands => ["тисяча", "тисячі", "тисяч"],
      :millions => ["мільйон", "мільйона", "мільйонів"],
      :billions => ["мільярд", "мільярда", "мільярдів"],
      100 => "сто",
      200 => "двісті",
      300 => "триста",
      400 => "чотириста",
      500 => "п'ятьсот",
      600 => "шістсот",
      700 => "сімсот",
      800 => "вісімсот",
      900 => "дев'ятсот",

      10 => "десять",
      11 => "одинадцять",
      12 => "дванадцять",
      13 => "тринадцять",
      14 => "чотирнадцять",
      15 => "п'ятнадцять",
      16 => "шістнадцять",
      17 => "сімнадцять",
      18 => "вісімнадцять",
      19 => "дев'ятнадцять",
      20 => "двадцять",
      30 => "тридцять",
      40 => "сорок",
      50 => "п'ятьдесят",
      60 => "шістдесят",
      70 => "сімдесят",
      80 => "вісімдесят",
      90 => "дев'яносто",
      # единицы, местами - c учетом рода
      1 => %{1 => "один", 2 => "одна", 3 => "одне"},
      2 => %{1 => "два", 2 => "дві", 3 => "два"},
      3 => "три",
      4 => "чотири",
      5 => "п'ять",
      6 => "шість",
      7 => "сім",
      8 => "вісім",
      9 => "дев'ять",
      :rub_integral => ["рубль", "рубля", "рублів"],
      :rub_fraction => ["копійка", "копійки", "копійок"],
      :uah_integral => ["гривня", "гривні", "гривень"],
      :uah_fraction => ["копійка", "копійки", "копійок"],
      :kzt_integral => ["тенге", "тенге", "тенге"],
      :kzt_fraction => ["тиын", "тиына", "тиынов"],
      :eur_integral => ["євро", "євро", "євро"],
      :eur_fraction => ["євроцент", "євроцента", "євроцентів"],
      :usd_integral => ["долар", "долара", "доларів"],
      :usd_fraction => ["цент", "цента", "центів"],
    }
  }

  @money_genders %{
    :rub => 1,
    :usd => 1,
    :uah => 2,
    :eur => 1,
    :kzt => 1,
  }


  def translations, do: @translations
  def money_genders, do: @money_genders

  def rublej(amount, locale \\ :ru, options \\ %{}) do
    integrals_key = :rub_integral
    fractions_key = :rub_fraction
    money_gender = ExPropisju.money_genders[:rub]

    money(amount, locale, integrals_key, fractions_key, money_gender, true, false, options)
  end

  # Выводит сумму данного существительного прописью и выбирает правильное число и падеж
  #
  #    RuPropisju.propisju_shtuk(21, 3, "колесо", "колеса", "колес") #=> "двадцать одно колесо"
  #    RuPropisju.propisju_shtuk(21, 1, "мужик", "мужика", "мужиков") #=> "двадцать один мужик"
  def propisju_shtuk(items, gender, forms, locale \\ :ru) do
    # if (items == items.to_i)
      [propisju(items, gender, locale), choose_plural(items, forms)] |> List.flatten |> Enum.join(" ")
    # else
    #   [propisju(items, gender, locale), forms[1]]
    # end

    # elements.join(" ")
  end

  # Выбирает корректный вариант числительного в зависимости от рода и числа и оформляет сумму прописью
  #
  #   propisju(243, 1) => "двести сорок три"
  #   propisju(221, 2) => "двести двадцать одна"
  def propisju(amount, gender, locale \\ :ru) do
    if is_integer amount do
      propisju_int(amount, gender, [], locale)
    else # также сработает для Decimal, дробные десятичные числительные в долях поэтому женского рода
      # propisju_float(amount, locale)
    end
  end

  # Выбирает нужный падеж существительного в зависимости от числа
  #
  #   choose_plural(3, "штука", "штуки", "штук") #=> "штуки"
  def choose_plural(amount, variants \\ []) do
    mod_ten = rem(amount, 10)
    mod_hundred = rem(amount, 100)
    variant = if (mod_ten == 1 && mod_hundred != 11) do
        1
    else
      if mod_ten >= 2 && mod_ten <= 4 && (mod_hundred <10 || rem(mod_hundred, 100) >=20) do
        2
      else
        3
      end
    end
    Enum.at(variants, variant-1)
  end


	def money(amount, locale, integrals_key, fractions_key, money_gender, fraction_as_number \\ false, integrals_as_number \\ false, options \\ {}) do

    # options[:integrals_formatter] ||= '%d'
    # options[:fraction_formatter] ||= '%d'
    # options[:integrals_delimiter] ||= ''
    # options[:always_show_fraction] ||= false

    locale_data = pick_locale(ExPropisju.translations, Atom.to_string(locale))
    integrals = locale_data[integrals_key]
    fractions = locale_data[fractions_key]

    if zero?(amount) do
      zero(locale_data, integrals, fractions, fraction_as_number, integrals_as_number, options)
    else
      parts = []

      # unless amount.to_i == 0
      #   if integrals_as_number
      #     parts << format_integral(amount.to_i, options) << choose_plural(amount.to_i, integrals)
      #   else
          parts = parts ++ propisju_int(amount, money_gender, integrals, locale)
        # end
      # end

      # if amount.kind_of?(Float) || amount.kind_of?(BigDecimal)
        # remainder = (amount.divmod(1)[1]*100).round
        # if remainder == 100
        #   parts = [propisju_int(amount.to_i + 1, money_gender, integrals, locale)]
        #   parts << zero_fraction(locale, money_gender, fractions, fraction_as_number, options) if options[:always_show_fraction]
        # else
        #   if fraction_as_number
        #     kop = remainder.to_i
        #     if (!kop.zero? || options[:always_show_fraction])
        #       parts << format(options[:fraction_formatter], kop) << choose_plural(kop, fractions)
        #     end
        #   else
        #     parts << propisju_int(remainder.to_i, money_gender, fractions, locale)
        #   end
        # end
      # else
        # parts << zero_fraction(locale, money_gender, fractions, fraction_as_number, options) if options[:always_show_fraction]
      # end

      Enum.join(parts, " ")
    end
  end

  # Выполняет преобразование числа из цифрого вида в символьное
  #
  #   amount - числительное
  #   gender   = 1 - мужской, = 2 - женский, = 3 - средний
  #   one_item - именительный падеж единственного числа (= 1)
  #   two_items - родительный падеж единственного числа (= 2-4)
  #   five_items - родительный падеж множественного числа ( = 5-10)
  #
  # Примерно так:
  #   propisju(42, 1, ["сволочь", "сволочи", "сволочей"]) # => "сорок две сволочи"
  def propisju_int(amount, gender \\ 1, item_forms \\ [], locale \\ :ru) do

    locale_root = pick_locale(ExPropisju.translations, Atom.to_string(locale))

    # # zero!
    if zero?(amount) do
      [locale_root['0'], item_forms[-1]] |> Enum.join(' ')
    end

    fractions = [
      [:trillions, 1_000_000_000_000],
      [:billions, 1_000_000_000],
      [:millions, 1_000_000],
      [:thousands, 1_000]
    ]

    parts = Enum.map(fractions, fn([name | multiplier]) ->
      [name, fraction = div(amount, multiplier |> List.last) |> rem(1000)]
    end)

    # # Единицы обрабатываем отдельно
    ones = rem(amount, 1000)

    # Составляем простые тысячные доли
    parts_in_writing = Enum.reject(parts, fn(part) ->
        zero?(part |> List.last)
      end)
    |> Enum.map(fn([name, fraction]) ->
        thousandth_gender = if (name == :thousands), do: 2, else: 1
        compose_ordinal(fraction, thousandth_gender, locale_root[name], locale)
    end)

    # И только единицы обрабатываем с переданными параметрами
    parts_in_writing = parts_in_writing ++ [(compose_ordinal(ones, gender, item_forms, locale))]

  end


    # Cоставляет число прописью для чисел до тысячи
    # ExPropisju.compose_ordinal("123", 1, ["рубль", "рубля", "рублей"], :ru)
  def compose_ordinal(remaining_amount_or_nil, gender, item_forms \\ [], locale \\ :ru) do

    # {remaining_amount, _} = Integer.parse(remaining_amount_or_nil)
    remaining_amount = remaining_amount_or_nil

    locale = Atom.to_string(locale)

    # Ноль чего-то
    # return "ноль %s" % item_forms[3] if remaining_amount_or_nil.zero?

    [rest, rest1, chosen_ordinal, ones, tens, hundreds] = Enum.map(1..6, fn(x) -> nil end)

    rest = rem(remaining_amount, 1000)
    remaining_amount = remaining_amount / 1000
    if zero?(rest) do
      # последние три знака нулевые
      Enum.at(item_forms, 2)
    end

    locale_root = pick_locale(ExPropisju.translations, locale)

    # начинаем подсчет с Rest
    # сотни
    hundreds = locale_root[div(rest, 100) * 100]

    # # десятки
    rest = rem(rest, 100)
    rest1 = div(rest, 10)

    # # единички
    ones = ""
    bla = if rest1 == 1, do: rest, else: rest1 * 10
    tens = locale_root[bla]

    # # индекс выбранной формы
    chosen_ordinal = 2
    if rest1 < 1 || rest1 > 1 do # единицы
      value = locale_root[rem(rest, 10)]
      # если попался хэш, делаем выбор согласно рода
      if is_map(value), do: value = value[gender]
      ones = value
      case rem(rest, 10) do
        1 ->
          chosen_ordinal = 0 # индекс формы меняется
        x when x in 2..4 ->
          chosen_ordinal = 1 # индекс формы меняется
        _ ->
      end
    end

    plural = [
      hundreds,
      tens,
      ones,
      Enum.at(item_forms, chosen_ordinal),
    ]
    |> Enum.reject(fn(x) -> x == ""end)
    |> Enum.join(" ")
    |> String.strip

    plural
  end

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false

  def zero(locale_data, integrals, fractions, fraction_as_number, integrals_as_number, options) do
    integ = if integrals_as_number, do: "0", else: locale_data['0']
    frac = if fraction_as_number, do: "0", else: locale_data['0']
    [integ , List.last(integrals), frac, List.last(fractions)]
    |> Enum.join(" ")
  end


  def pick_locale(from_hash, locale) do
    if Map.has_key?(from_hash, locale) do
      from_hash[locale]
    else
      raise UnknownLocale, message: "Unknown locale #{locale}"
    end
  end

end
