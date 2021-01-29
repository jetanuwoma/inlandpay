import Axios from 'axios';

export default class Api {
  static Transaction = {
    createTransaction: (url, data, token) => {
      return Axios.post(url, data, {
        headers: {
          'X-CSRF-Token': token
        }
      });
    }
  }
}
