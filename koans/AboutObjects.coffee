describe 'About Objects', ->
  describe 'Properties', ->
    meglomaniac = {}
    beforeEach -> meglomaniac = mastermind: 'Joker', henchwoman: 'Harley'

    it 'should confirm objects are collections of properties', ->
      expect(meglomaniac.mastermind).toBe('Joker')

    it 'should confirm that properties are case sensitive', ->
      expect(meglomaniac.henchwoman).toBe('Harley')
  # end Properties section

  it 'should know properties that are functions act like methods', ->
    # Coffeescript supports multi-line assignments and heredocs
    meglomaniac =
      mastermind: 'Brain',
      henchman: 'Pinky',
      battleCry: (noOfBrains) ->
        'They are ' + @henchman + ' and the' +
        Array(noOfBrains + 1).join(' ' + @mastermind) # In Coffeescript '@' = 'this'

    battleCry = meglomaniac.battleCry 4
    expect('They are Pinky and the Brain Brain Brain Brain').toMatch(battleCry)


  it "should confirm that when a function is attached to an object, 'this' refers to the object", ->
    currentYear = (new Date).getFullYear()
    meglomaniac =
      mastermind: 'James Wood'
      henchman: 'Adam West'
      birthYear: 1970
      calculateAge: -> currentYear - @birthYear

    expect(currentYear).toBe((new Date).getFullYear())
    expect(meglomaniac.calculateAge()).toBe(parseInt((new Date).getFullYear())-meglomaniac.birthYear)


  describe "'in' keyword", ->
    meglomaniac = {}
    beforeEach ->
      meglomaniac =
        mastermind: 'The Monarch'
        henchwoman: 'Dr Girlfriend'
        theBomb: true

    it 'should have the bomb', ->
      hasBomb = meglomaniac.theBomb? # ? is the existence operator
      expect(hasBomb).toBe(true)

    it 'should not have the detonator however', ->
      hasDetonator = meglomaniac.theDetonator?
      expect(hasDetonator).toBe(false)
  # end 'in' keyword section

  it 'should know that properties can be added and deleted', ->
    meglomaniac =
      mastermind : 'Agent Smith'
      henchman: 'Agent Smith'

    expect(meglomaniac.secretary?).toBe(false)

    meglomaniac.secretary = 'Agent Smith'
    expect(meglomaniac.secretary?).toBe(true)

    delete meglomaniac.henchman
    expect(meglomaniac.henchman?).toBe(false)


  it 'should use prototype to add to all objects', ->
      Circle = (radius) -> @radius = radius

      simpleCircle = new Circle(10)
      colouredCircle = new Circle(5)
      colouredCircle.colour = 'red'

      expect(simpleCircle.colour).toBe(undefined)
      expect(colouredCircle.colour).toBe('red')

      Circle.prototype.describe = -> 'This circle has a radius of: ' + @radius

      expect(simpleCircle.describe()).toBe(FILL_ME_IN)
      expect(colouredCircle.describe()).toBe(FILL_ME_IN)


