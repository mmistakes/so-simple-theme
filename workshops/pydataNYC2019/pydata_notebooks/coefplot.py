import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl

font = {'family' : 'normal',
        'size'   : 16}

mpl.rc('font', **font)

country_list = ['USA', 'France', 'Germany', 'Australia', 'Netherlands', 'England',
             'Japan', 'Canada', 'Brazil', 'Sweden', 'Spain', 'New Zealand',
             'Norway', 'China', 'South Korea', 'Italy', 'Nigeria', 'Cameroon',
             'South Africa', 'Jamaica', 'Scotland', 'Thailand', 'Chile',
             'Argentina']

def fake_data(n):
    del_x = 0.2
    if n > 24:
        print('the maximum for n is 24 :-(')
        n = 24

    names = np.random.choice(country_list, n, replace=False)
    averages = 2*np.random.random(n) - 1

    df = pd.DataFrame({'average': averages,
                       'names': names})
    df.loc[:, 'left'] = df.average - del_x
    df.loc[:, 'right'] = df.average + del_x
    return df

def coefficient_plot(x, left, right, actual_data, names=None, title=None,
                     fig_size =None):
    fig, ax = plt.subplots(figsize=fig_size)

    # Guideline (First = underneath everything else).
    ax.plot([0, 0], [-1, x.size+0.5], '--', color='grey', lw=3)
    ax.set_ylim([-0.5, x.size])

    # Plot horizontal bars.
    for row, pair in enumerate(zip(left, right)):
        ax.plot(pair, [row,row], lw=3)

    # Plot averages.
    ax.plot(x, np.arange(x.size), 'o', color='black')

    #Plot real data where applicable
    ax.plot(actual_data, np.arange(actual_data.size), 'o', color='red')

    # Names.
    if names is not None:
        ax.set_yticks(np.arange(x.size))
        ax.set_yticklabels(names)

    if title is not None:
        ax.set_title(title, pad=40)

    # Clean up plot.
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_visible(False)
    ax.spines['bottom'].set_visible(False)
    ax.xaxis.tick_top()
    ax.yaxis.grid(linestyle='dotted')

    # Save or plot.
    #plt.savefig('example.png', bbox_inches='tight', dpi=300)
    #plt.show()


def main():
    # Create Fake data.
    df = fake_data(24)

    # Sort on average.
    df = df.sort_values(by='average')

    # Plot.
    actual_data = averages = 2*np.random.random(24) - 1
    coefficient_plot(df['average'], df['left'], df['right'], actual_data,
                     names=df['names'], title='Example Coefficient Plot', fig_size = (8.12))

if __name__ == '__main__':
    main()
