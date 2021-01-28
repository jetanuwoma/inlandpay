import Axios from 'axios';

export default class Api {
  static Transaction = {
    createTransaction: (url, data) => {
      return Axios.post(url, data);
    }
  }
}
