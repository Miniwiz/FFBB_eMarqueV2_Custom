const _ = require('lodash')
module.exports = /* DON'T REMOVE THOSE COMMENTS *//* MODULE SEPARATION */new Object({
  /**
   * return the name followed by the first letter of the person in param
   * @param  {object} official
   * @return {string}           returns LASTNAME F.
   */
  getNameAndFirstLetterOfFirstName: person => {
    let composedName = ''
    if (person && person.lastName) {
      composedName += (person.lastName + ' ').toUpperCase()
    }
    if (person && person.firstName) {
      composedName += (person.firstName)[0].toUpperCase() + '.'
    }
    return composedName
  },
  /**
   * export events from each type that are necessary in the match sheet, ecluding deleted ones
   * @param  {object} match history of the match
   * @return {object}       events sorted by type
   */
  exportEvents: history => {
    return {
      reserves: _.filter(history, {code: 'RS'}),
      incidents: _.filter(history, {code: 'IC'}),
      technicalFouls: _.filter(history, function (fj) { // T = technical, D = disqualifying, F = fight
        return (fj.code === 'FJ') && (['T', 'D', 'F', 'B', 'C'].indexOf(fj.fields.type.code) !== -1)
      }),
      claims: _.filter(history, function (item) {
        return item.code === 'RC' && !item.unconfirmed
      }),
      timeouts: _.filter(history, {code: 'TME'})
    }
  },

  getHalf (period, periodByHalf) {
    return (period <= periodByHalf ? 0
      : (period <= periodByHalf * 2 ? 1 : 2))
  }
})
