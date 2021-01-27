import React from 'react';
import PropTypes from 'prop-types';

export default class Card extends  React.Component {
    render() {
        const { name, balance, code } = this.props;
        return (
          <div className="col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
              <div className="card">
                  <div className="card-header">
                      <a href={`/wallets/${code}`}>{code}</a>
                  </div>
                  <div className="card-body">
                      <p>{name}</p>
                      <p>Balance: <strong>{balance}</strong></p>
                  </div>
              </div>
          </div>
        )
    }
}

Card.propTypes = {
    name: PropTypes.string.isRequired,
    balance: PropTypes.any.isRequired,
    code: PropTypes.string.isRequired,
}

